import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/features/audio/ui/bottom_player.dart';
import 'package:mplayer/features/library/ui/library_screen.dart';
import 'package:mplayer/features/ai/ui/ai_playlist_screen.dart';
import 'package:mplayer/features/youtube/ui/youtube_screen.dart';
import 'package:mplayer/features/audio/models/song.dart';

import 'package:mplayer/features/audio/logic/audio_providers.dart';

import 'package:mplayer/features/search/ui/search_screen.dart';
import 'package:mplayer/features/settings/ui/settings_screen.dart';
import 'package:mplayer/features/stats/ui/stats_dashboard_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0; // Default to Home

  final List<Widget> _screens = [
    const HomeTab(),
    const LibraryScreen(),
    const YouTubeScreen(),
    const AiPlaylistScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              // App Icon (8px from edge + 44px icon)
              ClipOval(
                child: Image.asset(
                  'assets/icon/app_icon.png',
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8), // Fixed 8px gap
              // Search Bar (Flexible space)
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      // Use pure white in light mode, otherwise Tone 97 of secondary in dark mode
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : Color.alphaBlend(
                              Theme.of(context).colorScheme.secondary
                                  .withValues(alpha: 0.03), // Tone 97
                              Theme.of(context).colorScheme.surface,
                            ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Search Music',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8), // Fixed 8px gap
              // Stats Hub Icon (44px)
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const StatsDashboardScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.surfaceContainerHigh,
                  ),
                  child: const Icon(Icons.analytics_outlined, size: 18),
                ),
              ),
              const SizedBox(width: 8),
              // Settings Icon (44px icon + 8px from edge)
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // Use M3 standard surface container for subtle background
                    color: Theme.of(context).colorScheme.surfaceContainerHigh,
                  ),
                  child: const Icon(Icons.settings, size: 18),
                ),
              ),
            ],
          ),
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BottomPlayer(),
          NavigationBar(
            height: 54, // Reduces the whitespace below the icons
            selectedIndex: _currentIndex,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            onDestinationSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined, size: 20),
                selectedIcon: Icon(Icons.home, size: 20),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.music_note_outlined, size: 20),
                selectedIcon: Icon(Icons.music_note, size: 20),
                label: 'Library',
              ),
              NavigationDestination(
                icon: Icon(Icons.cloud_outlined, size: 20),
                selectedIcon: Icon(Icons.cloud, size: 20),
                label: 'YT Music',
              ),
              NavigationDestination(
                icon: Icon(Icons.queue_music_outlined, size: 20),
                selectedIcon: Icon(Icons.queue_music, size: 20),
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 1, // Makes it a square
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      colors: [Colors.deepPurple, Colors.pinkAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pinkAccent.withValues(alpha: 0.4),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.music_note,
                              size: 60,
                              color: Colors.white,
                            ),
                            SizedBox(width: 16),
                            Icon(
                              Icons.headphones,
                              size: 60,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'MPlayer',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
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
