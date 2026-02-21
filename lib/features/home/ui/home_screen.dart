import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/features/audio/ui/bottom_player.dart';
import 'package:mplayer/features/library/ui/library_screen.dart';
import 'package:mplayer/features/ai/ui/ai_playlist_screen.dart';
import 'package:mplayer/features/youtube/ui/youtube_screen.dart';
import 'package:mplayer/features/audio/models/song.dart';

import 'package:mplayer/features/audio/logic/audio_providers.dart';

import 'package:mplayer/features/settings/ui/settings_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 1; // Default to Library for now

  final List<Widget> _screens = [
    const HomeTab(),
    const LibraryScreen(),
    const YouTubeScreen(),
    const AiPlaylistScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BottomPlayer(),
          NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.music_note_outlined),
                selectedIcon: Icon(Icons.music_note),
                label: 'Library',
              ),
              NavigationDestination(
                icon: Icon(Icons.cloud_outlined),
                selectedIcon: Icon(Icons.cloud),
                label: 'YT Music',
              ),
              NavigationDestination(
                icon: Icon(Icons.queue_music_outlined),
                selectedIcon: Icon(Icons.queue_music),
                label: 'Playlists',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentSongsAsync = ref.watch(recentSongsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
            tooltip: 'Settings',
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Recently Added',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          recentSongsAsync.when(
            data: (songs) {
              if (songs.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(child: Text('No recent songs')),
                );
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final song = songs[index];
                  return ListTile(
                    leading: const Icon(Icons.music_note),
                    title: Text(song.title, maxLines: 1),
                    subtitle: Text(song.artist, maxLines: 1),
                    onTap: () async {
                      final audioHandler = await ref.read(
                        audioHandlerProvider.future,
                      );
                      final mediaItems = songs
                          .map((s) => s.toMediaItem())
                          .toList();

                      await audioHandler.playFromQueue(mediaItems, index);
                    },
                  );
                }, childCount: songs.length),
              );
            },
            loading: () => const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (err, stack) =>
                SliverToBoxAdapter(child: Center(child: Text('Error: $err'))),
          ),
        ],
      ),
    );
  }
}
