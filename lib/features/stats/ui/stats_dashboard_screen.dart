import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/features/settings/logic/settings_provider.dart';
import 'package:mplayer/features/settings/logic/settings_repository.dart';
import 'package:mplayer/features/stats/logic/stats_repository.dart';
import 'package:mplayer/features/audio/models/song.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class StatsDashboardScreen extends ConsumerStatefulWidget {
  const StatsDashboardScreen({super.key});

  @override
  ConsumerState<StatsDashboardScreen> createState() =>
      _StatsDashboardScreenState();
}

class _StatsDashboardScreenState extends ConsumerState<StatsDashboardScreen> {
  String? _personaSummary;
  bool _isGeneratingPersona = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // We can use FutureProviders, but simple FutureBuilder inside widgets is fine for this demo
    // Alternatively, let's use Riverpod's future watcher nicely if we had providers,
    // but calling the repository directly works too.

    return Scaffold(
      appBar: AppBar(title: const Text('Statistics Hub')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListeningTimeCard(theme),
            const SizedBox(height: 24),
            _buildPersonaCard(theme),
            const SizedBox(height: 24),
            Text(
              'Most Played',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildMostPlayedList(),
            const SizedBox(height: 24),
            Text(
              'Frequently Skipped',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildMostSkippedList(),
          ],
        ),
      ),
    );
  }

  Widget _buildListeningTimeCard(ThemeData theme) {
    return FutureBuilder<int>(
      future: ref.read(statsRepositoryProvider).getTotalListeningTimeMs(),
      builder: (context, snapshot) {
        final totalMs = snapshot.data ?? 0;
        final minutes = totalMs ~/ 60000;
        final hours = minutes ~/ 60;
        final remainingMins = minutes % 60;

        return Card(
          elevation: 0,
          color: theme.colorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Icon(
                  Icons.access_time_filled,
                  size: 48,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Listening Time',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                    Text(
                      '$hours hrs $remainingMins mins',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPersonaCard(ThemeData theme) {
    return Card(
      elevation: 0,
      color: theme.colorScheme.secondaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.psychology, color: theme.colorScheme.secondary),
                const SizedBox(width: 8),
                Text(
                  'Your Music Persona (AI)',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_personaSummary != null)
              Text(
                _personaSummary!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSecondaryContainer,
                ),
              )
            else if (_isGeneratingPersona)
              const Center(child: CircularProgressIndicator())
            else
              Center(
                child: FilledButton.tonal(
                  onPressed: _generatePersona,
                  child: const Text('Analyze My Taste'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _generatePersona() async {
    setState(() {
      _isGeneratingPersona = true;
      _personaSummary = null;
    });

    try {
      // We will prompt Gemini with top songs to generate a persona.
      final topSongs = await ref
          .read(statsRepositoryProvider)
          .getMostPlayed(limit: 20);
      final songsListText = topSongs
          .map((s) => '${s.title} by ${s.artist}')
          .join('\n');

      final prompt =
          '''
Based on these top 20 most played songs, write a 2-3 sentence engaging "Music Persona" 
summarizing my taste, like Spotify Wrapped. Be creative and fun!
Songs:
$songsListText
''';

      // We need to use the generative model directly since geminiService.generatePlaylist
      // is specifically tailored for generating song IDs.
      // Let's implement a direct call to avoid altering existing gemini_service if we don't have to,
      // actually geminiService has apiKey fetch logic inside `generatePlaylist`.
      // Let's just create a new prompt using standard google_generative_ai.

      final apiKey = await ref
          .read(settingsRepositoryProvider)
          .getSetting(SettingsRepository.geminiApiKey);
      if (apiKey == null || apiKey.isEmpty) {
        throw Exception('API Key not found. Please add it in Settings.');
      }
      final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
      final response = await model.generateContent([Content.text(prompt)]);

      setState(() {
        _personaSummary = response.text ?? 'Could not generate persona.';
        _isGeneratingPersona = false;
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          _isGeneratingPersona = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  Widget _buildMostPlayedList() {
    return FutureBuilder<List<Song>>(
      future: ref.read(statsRepositoryProvider).getMostPlayed(limit: 5),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final songs = snapshot.data ?? [];
        if (songs.isEmpty) return const Text('No data yet.');

        return Column(
          children: songs
              .map(
                (song) => ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.play_arrow, size: 16),
                      Text(
                        '${song.playCount}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    song.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    song.artist,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildMostSkippedList() {
    return FutureBuilder<List<Song>>(
      future: ref.read(statsRepositoryProvider).getMostSkipped(limit: 5),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final songs = snapshot.data ?? [];
        if (songs.isEmpty) return const Text('No data yet.');

        return Column(
          children: songs
              .map(
                (song) => ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.skip_next,
                        size: 16,
                        color: Colors.redAccent,
                      ),
                      Text(
                        '${song.skipCount}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    song.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    song.artist,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
