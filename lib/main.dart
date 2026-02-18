import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/features/audio/logic/audio_providers.dart';
import 'package:mplayer/features/audio/logic/mplayer_audio_handler.dart';
import 'package:mplayer/features/audio/models/song.dart';

void main() {
  runApp(const ProviderScope(child: MPlayerApp()));
}

class MPlayerApp extends StatelessWidget {
  const MPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MPlayer',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: const LibraryScreen(),
    );
  }
}

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songsAsync = ref.watch(allSongsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Library'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {
              ref.read(songRepositoryProvider).scanAndSync();
            },
            tooltip: 'Scan Songs',
          ),
        ],
      ),
      body: songsAsync.when(
        data: (songs) {
          if (songs.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.music_off, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text('No songs found.'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        ref.read(songRepositoryProvider).scanAndSync(),
                    child: const Text('Scan Device'),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index];
              return ListTile(
                leading: const Icon(Icons.music_note),
                title: Text(song.title, maxLines: 1),
                subtitle: Text(song.artist, maxLines: 1),
                trailing: Text(_formatDuration(song.duration)),
                onTap: () async {
                  final audioHandler = await ref.read(
                    audioHandlerProvider.future,
                  );
                  final mediaItems = songs.map((s) => s.toMediaItem()).toList();

                  // Cast to MPlayerAudioHandler to access custom method
                  if (audioHandler is MPlayerAudioHandler) {
                    await audioHandler.playFromQueue(mediaItems, index);
                  } else {
                    // Fallback if we strictly use AudioHandler interface (though we know the concrete type here)
                    await audioHandler.updateQueue(mediaItems);
                    await audioHandler.skipToQueueItem(index);
                    await audioHandler.play();
                  }
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  String _formatDuration(int ms) {
    final duration = Duration(milliseconds: ms);
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
