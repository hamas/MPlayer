import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/features/ai/logic/gemini_service.dart';
import 'package:mplayer/features/audio/logic/audio_providers.dart';
import 'package:mplayer/features/audio/models/song.dart';
import 'package:mplayer/features/settings/logic/settings_provider.dart';
import 'package:mplayer/features/settings/logic/settings_repository.dart';
import 'package:mplayer/features/settings/ui/settings_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AiPlaylistScreen extends ConsumerStatefulWidget {
  const AiPlaylistScreen({super.key});

  @override
  ConsumerState<AiPlaylistScreen> createState() => _AiPlaylistScreenState();
}

class _AiPlaylistScreenState extends ConsumerState<AiPlaylistScreen> {
  final _promptController = TextEditingController();
  bool _isLoading = false;
  List<Song> _generatedSongs = [];
  String? _error;

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  Future<void> _generatePlaylist() async {
    final apiKey = await ref
        .read(settingsRepositoryProvider)
        .getSetting(SettingsRepository.geminiApiKey);
    if (apiKey == null || apiKey.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Please set your Gemini API Key first.'),
            action: SnackBarAction(
              label: 'Settings',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
          ),
        );
      }
      return;
    }

    final prompt = _promptController.text.trim();
    if (prompt.isEmpty) return;

    setState(() {
      _isLoading = true;
      _error = null;
      _generatedSongs = [];
    });

    try {
      // 1. Generate IDs
      final ids = await ref
          .read(geminiServiceProvider)
          .generatePlaylist(prompt);

      if (ids.isEmpty) {
        setState(() {
          _error = "No songs found for that prompt.";
          _isLoading = false;
        });
        return;
      }

      // 2. Fetch Songs
      final songs = await ref.read(songRepositoryProvider).getSongsByIds(ids);

      setState(() {
        _generatedSongs = songs;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _playAll() async {
    if (_generatedSongs.isEmpty) return;

    final audioHandler = await ref.read(audioHandlerProvider.future);
    final mediaItems = _generatedSongs.map((s) => s.toMediaItem()).toList();

    await audioHandler.playFromQueue(mediaItems, 0);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Playlist Generator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create a playlist with AI',
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _promptController,
                      decoration: InputDecoration(
                        hintText: 'e.g., "Upbeat music for running"',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: _isLoading ? null : _generatePlaylist,
                        ),
                      ),
                      onSubmitted: (_) =>
                          _isLoading ? null : _generatePlaylist(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Results Section
            if (_isLoading)
              const Expanded(child: Center(child: CircularProgressIndicator()))
            else if (_error != null)
              Expanded(
                child: Center(
                  child: Text(
                    _error!,
                    style: TextStyle(color: theme.colorScheme.error),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            else if (_generatedSongs.isNotEmpty)
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Generated Playlist (${_generatedSongs.length})',
                            style: theme.textTheme.titleSmall,
                          ),
                          FilledButton.icon(
                            onPressed: _playAll,
                            icon: const Icon(Icons.play_arrow),
                            label: const Text('Play All'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _generatedSongs.length,
                        itemBuilder: (context, index) {
                          final song = _generatedSongs[index];
                          return ListTile(
                                leading: const Icon(Icons.music_note),
                                title: Text(song.title, maxLines: 1),
                                subtitle: Text(song.artist, maxLines: 1),
                                onTap: () {
                                  _playAllStartingAt(index);
                                },
                              )
                              .animate()
                              .slideX(
                                begin: 0.1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOutBack,
                              )
                              .fade();
                        },
                      ),
                    ),
                  ],
                ),
              )
            else
              const Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.auto_awesome, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('Enter a prompt to generate a playlist.'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _playAllStartingAt(int index) async {
    if (_generatedSongs.isEmpty) return;

    final audioHandler = await ref.read(audioHandlerProvider.future);
    final mediaItems = _generatedSongs.map((s) => s.toMediaItem()).toList();

    await audioHandler.playFromQueue(mediaItems, index);
  }
}
