import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/features/audio/logic/audio_providers.dart';
import 'package:mplayer/features/youtube/logic/youtube_auth_service.dart';
import 'package:mplayer/features/youtube/logic/youtube_data_service.dart';
import 'package:mplayer/features/youtube/ui/browser_login_screen.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class YouTubeScreen extends ConsumerStatefulWidget {
  const YouTubeScreen({super.key});

  @override
  ConsumerState<YouTubeScreen> createState() => _YouTubeScreenState();
}

class _YouTubeScreenState extends ConsumerState<YouTubeScreen> {
  final _searchController = TextEditingController();
  List<Map<String, String>> _searchResults = [];
  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _performSearch(String query) async {
    if (query.trim().isEmpty) return;
    setState(() => _isSearching = true);
    final results = await ref.read(youtubeDataServiceProvider).search(query);
    if (mounted) {
      setState(() {
        _searchResults = results;
        _isSearching = false;
      });
    }
  }

  void _playTrack(Map<String, String> track) async {
    // Show loading indicator
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Extracting audio for ${track['title']}...'),
        duration: const Duration(seconds: 1),
      ),
    );

    final extractor = ref.read(ytExtractorProvider);
    final streamUrl = await extractor.getAudioStreamUrl(track['id']!);

    if (streamUrl != null) {
      final mediaItem = MediaItem(
        id: track['id']!,
        title: track['title'] ?? 'Unknown',
        artist: track['artist'] ?? 'Unknown',
        artUri: Uri.tryParse(track['thumbnail'] ?? ''),
        extras: {'url': streamUrl},
      );

      final handler = await ref.read(audioHandlerProvider.future);

      // Play immediately by creating a short queue context
      // (in production we might enqueue the whole search results)
      await handler.playFromQueue([mediaItem], 0);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to extract audio stream.')),
        );
      }
    }
  }

  void _downloadTrack(Map<String, String> track) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Starting download for ${track['title']}...')),
    );

    try {
      final extractor = ref.read(ytExtractorProvider);
      final streamUrl = await extractor.getAudioStreamUrl(track['id']!);

      if (streamUrl == null) {
        throw Exception('Stream URL not found.');
      }

      final dir = await getApplicationDocumentsDirectory();
      // Clean filename
      final safeTitle = track['title']!.replaceAll(RegExp(r'[\\/:*?"<>|]'), '');
      final safeArtist = track['artist']!.replaceAll(
        RegExp(r'[\\/:*?"<>|]'),
        '',
      );
      final savePath = '${dir.path}/$safeTitle - $safeArtist.m4a';

      final dio = Dio();
      await dio.download(streamUrl, savePath);

      // Save to library
      await ref
          .read(songRepositoryProvider)
          .addDownloadedSong(
            path: savePath,
            title: track['title'] ?? 'Unknown',
            artist: track['artist'] ?? 'Unknown',
            album: 'YouTube Downloads',
            artworkUri: track['thumbnail'],
          );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${track['title']} downloaded and added to Library!'),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Download failed: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = ref.watch(youtubeAuthProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('YT Music'),
        actions: [
          if (isLoggedIn)
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Disconnect Account',
              onPressed: () {
                ref.read(youtubeAuthProvider.notifier).clearCookies();
                setState(() => _searchResults.clear());
              },
            ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search songs, artists...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() => _searchResults.clear());
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: theme.colorScheme.surfaceContainerHighest,
              ),
              onSubmitted: _performSearch,
            ),
          ),

          if (!isLoggedIn && _searchResults.isEmpty) ...[
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_off,
                      size: 64,
                      color: theme.colorScheme.outline,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Search globally anonymously',
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    const Text('OR', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 8),
                    FilledButton.icon(
                      onPressed: () => showYouTubeLoginModal(context),
                      icon: const Icon(Icons.login),
                      label: const Text('Connect YouTube Account'),
                    ),
                  ],
                ),
              ),
            ),
          ] else if (isLoggedIn && _searchResults.isEmpty && !_isSearching) ...[
            // Show Liked Songs automatically
            Expanded(
              child: _LikedSongsView(
                onTrackPlay: _playTrack,
                onTrackDownload: _downloadTrack,
              ),
            ),
          ] else if (_isSearching) ...[
            const Expanded(child: Center(child: CircularProgressIndicator())),
          ] else ...[
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final track = _searchResults[index];
                  return _TrackTile(
                        track: track,
                        onTap: () => _playTrack(track),
                        onDownload: () => _downloadTrack(track),
                      )
                      .animate()
                      .slideY(
                        begin: 0.1,
                        duration: const Duration(milliseconds: 300),
                      )
                      .fade();
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _LikedSongsView extends ConsumerStatefulWidget {
  final Function(Map<String, String>) onTrackPlay;
  final Function(Map<String, String>) onTrackDownload;
  const _LikedSongsView({
    required this.onTrackPlay,
    required this.onTrackDownload,
  });

  @override
  ConsumerState<_LikedSongsView> createState() => _LikedSongsViewState();
}

class _LikedSongsViewState extends ConsumerState<_LikedSongsView> {
  List<Map<String, String>> _songs = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    final songs = await ref.read(youtubeDataServiceProvider).getLikedSongs();
    if (mounted) {
      setState(() {
        _songs = songs;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());
    if (_songs.isEmpty) {
      return const Center(child: Text("No liked songs found."));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'Your Liked Songs',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _songs.length,
            itemBuilder: (context, index) {
              return _TrackTile(
                    track: _songs[index],
                    onTap: () => widget.onTrackPlay(_songs[index]),
                    onDownload: () => widget.onTrackDownload(_songs[index]),
                  )
                  .animate()
                  .slideY(
                    begin: 0.1,
                    duration: const Duration(milliseconds: 300),
                  )
                  .fade();
            },
          ),
        ),
      ],
    );
  }
}

class _TrackTile extends StatelessWidget {
  final Map<String, String> track;
  final VoidCallback onTap;
  final VoidCallback onDownload;

  const _TrackTile({
    required this.track,
    required this.onTap,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: track['thumbnail'] != null && track['thumbnail']!.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                track['thumbnail']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            )
          : const Icon(Icons.music_note, size: 50),
      title: Text(
        track['title'] ?? 'Unknown',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        track['artist'] ?? 'Unknown',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.download),
            tooltip: 'Download Offline',
            onPressed: onDownload,
          ),
          IconButton(
            icon: const Icon(Icons.play_arrow),
            tooltip: 'Play Now',
            onPressed: onTap,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
