import 'dart:io';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/features/audio/logic/audio_providers.dart';
import 'package:mplayer/features/audio/ui/player_screen.dart';

class BottomPlayer extends ConsumerWidget {
  const BottomPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioHandlerAsync = ref.watch(audioHandlerProvider);

    return audioHandlerAsync.when(
      data: (handler) => StreamBuilder<MediaItem?>(
        stream: handler.mediaItem,
        builder: (context, snapshot) {
          final mediaItem = snapshot.data;
          if (mediaItem == null) return const SizedBox.shrink();

          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const PlayerScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                        const begin = Offset(0.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.easeOutQuart;

                        final tween = Tween(
                          begin: begin,
                          end: end,
                        ).chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                ),
              );
            },
            child: Container(
              height: 64,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Artwork
                  AspectRatio(
                    aspectRatio: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        tag: 'media_artwork',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: _buildArtwork(context, mediaItem.artUri),
                        ),
                      ),
                    ),
                  ),
                  // Title & Artist
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mediaItem.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          mediaItem.artist ?? 'Unknown',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  // Controls
                  StreamBuilder<PlaybackState>(
                    stream: handler.playbackState,
                    builder: (context, snapshot) {
                      final playing = snapshot.data?.playing ?? false;
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              playing
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded,
                            ),
                            onPressed: () =>
                                playing ? handler.pause() : handler.play(),
                            iconSize: 32,
                          ),
                          IconButton(
                            icon: const Icon(Icons.skip_next_rounded),
                            onPressed: handler.skipToNext,
                          ),
                          const SizedBox(width: 8),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }

  Widget _buildArtwork(BuildContext context, Uri? uri) {
    if (uri == null) {
      return Container(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Icon(
          Icons.music_note,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      );
    }

    if (uri.scheme == 'file') {
      return Image.file(
        File(uri.toFilePath()),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
      );
    }

    // Fallback for network or other schemes
    return Image.network(
      uri.toString(),
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
    );
  }
}
