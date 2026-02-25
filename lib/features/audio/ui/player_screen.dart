import 'dart:io';
import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/features/audio/logic/audio_providers.dart';
import 'package:mplayer/features/audio/ui/lyrics_offset_sheet.dart';
import 'package:mplayer/presentation/components/wavy_music_slider.dart';

class PlayerScreen extends ConsumerWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioHandlerAsync = ref.watch(audioHandlerProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          onPressed: () => Navigator.of(context).pop(),
          tooltip: 'Collapse',
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert_rounded),
            tooltip: 'Options',
            onSelected: (value) {
              if (value == 'offset') {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const LyricsOffsetSheet(),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'offset',
                child: Text('Adjust Lyrics Timing'),
              ),
            ],
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: audioHandlerAsync.when(
        data: (handler) => StreamBuilder<MediaItem?>(
          stream: handler.mediaItem,
          builder: (context, snapshot) {
            final mediaItem = snapshot.data;
            if (mediaItem == null) return const Center(child: Text("No Media"));

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const Spacer(),
                  // Artwork
                  Hero(
                    tag: 'media_artwork',
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: _buildArtwork(mediaItem.artUri),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  // Title & Artist
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mediaItem.title,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          mediaItem.artist ?? 'Unknown Artist',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Seek Bar
                  StreamBuilder<AudioState>(
                    stream: _audioStateStream(handler),
                    builder: (context, snapshot) {
                      final state = snapshot.data ?? AudioState.zero;
                      return _SeekBar(
                        duration: state.duration,
                        position: state.position,
                        onChangeEnd: (newPosition) {
                          handler.seek(newPosition);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  // Controls
                  StreamBuilder<PlaybackState>(
                    stream: handler.playbackState,
                    builder: (context, snapshot) {
                      final playing = snapshot.data?.playing ?? false;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: handler.skipToPrevious,
                            icon: const Icon(Icons.skip_previous_rounded),
                            iconSize: 36,
                          ),
                          const SizedBox(width: 24),
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primaryContainer,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: playing ? handler.pause : handler.play,
                              icon: Icon(
                                playing
                                    ? Icons.pause_rounded
                                    : Icons.play_arrow_rounded,
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                              iconSize: 40,
                            ),
                          ),
                          const SizedBox(width: 24),
                          IconButton(
                            onPressed: handler.skipToNext,
                            icon: const Icon(Icons.skip_next_rounded),
                            iconSize: 36,
                          ),
                        ],
                      );
                    },
                  ),
                  const Spacer(),
                ],
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
      ),
    );
  }

  Widget _buildArtwork(Uri? uri) {
    if (uri == null) {
      return const Icon(Icons.music_note, size: 80);
    }
    if (uri.scheme == 'file') {
      return Image.file(
        File(uri.toFilePath()),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.music_note, size: 80),
      );
    }
    return Image.network(
      uri.toString(),
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.music_note, size: 80),
    );
  }

  Stream<AudioState> _audioStateStream(AudioHandler handler) {
    return Stream.periodic(const Duration(milliseconds: 200)).asyncMap((
      _,
    ) async {
      final playbackState = handler.playbackState.value;
      final mediaItem = handler.mediaItem.value;

      final duration = mediaItem?.duration ?? Duration.zero;
      var position = playbackState.position;

      if (playbackState.playing) {
        final timeDiff = DateTime.now().difference(playbackState.updateTime);
        position = position + timeDiff * playbackState.speed;
      }

      // Clamp position
      if (position > duration) position = duration;
      if (position < Duration.zero) position = Duration.zero;

      return AudioState(duration, position);
    });
  }
}

class AudioState {
  final Duration duration;
  final Duration position;

  const AudioState(this.duration, this.position);
  static const zero = AudioState(Duration.zero, Duration.zero);
}

class _SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final ValueChanged<Duration>? onChangeEnd;

  const _SeekBar({
    required this.duration,
    required this.position,
    this.onChangeEnd,
  });

  @override
  State<_SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<_SeekBar> {
  double? _dragValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final max = widget.duration.inMilliseconds.toDouble();
    final value = min(
      _dragValue ?? widget.position.inMilliseconds.toDouble(),
      max,
    );

    // Prevent invalid value for Slider
    final safeMax = max > 0 ? max : 1.0;
    final safeValue = value.clamp(0.0, safeMax);

    return Column(
      children: [
        WavyMusicSlider(
          min: 0.0,
          max: safeMax,
          value: safeValue,
          activeColor: theme.colorScheme.primary,
          inactiveColor: theme.colorScheme.surfaceContainerHighest,
          onChanged: (val) {
            setState(() {
              _dragValue = val;
            });
          },
          onChangeEnd: (val) {
            if (widget.onChangeEnd != null) {
              widget.onChangeEnd!(Duration(milliseconds: val.round()));
            }
            _dragValue = null;
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(Duration(milliseconds: safeValue.round())),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                _formatDuration(widget.duration),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
