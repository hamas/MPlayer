import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/features/audio/logic/audio_providers.dart';
// Note: In a full implementation, this offset would route to LyricsRepository to save.
// For this audit gap, we're building the UI and testing capability.

class LyricsOffsetSheet extends ConsumerStatefulWidget {
  const LyricsOffsetSheet({super.key});

  @override
  ConsumerState<LyricsOffsetSheet> createState() => _LyricsOffsetSheetState();
}

class _LyricsOffsetSheetState extends ConsumerState<LyricsOffsetSheet> {
  int _offsetMs = 0;

  void _adjustOffset(int delta) {
    setState(() {
      _offsetMs += delta;
    });
    // TODO: Broadcast to Lyrics provider to shift current display
  }

  void _testTiming() async {
    final handler = await ref.read(audioHandlerProvider.future);
    final state = handler.playbackState.value;

    // Seek back 5 seconds to test sync
    final target = state.position - const Duration(seconds: 5);
    await handler.seek(target < Duration.zero ? Duration.zero : target);

    if (!state.playing) {
      await handler.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Adjust Lyrics Timing',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Use this if the lyrics are out of sync with the audio.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filledTonal(
                onPressed: () => _adjustOffset(-100),
                icon: const Icon(Icons.remove),
                iconSize: 32,
              ),
              const SizedBox(width: 32),
              Column(
                children: [
                  Text(
                    '${_offsetMs > 0 ? '+' : ''}$_offsetMs',
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  Text('milliseconds', style: theme.textTheme.labelSmall),
                ],
              ),
              const SizedBox(width: 32),
              IconButton.filledTonal(
                onPressed: () => _adjustOffset(100),
                icon: const Icon(Icons.add),
                iconSize: 32,
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: _testTiming,
                  icon: const Icon(Icons.replay_5),
                  label: const Text('Test Sync'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Save and close
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Done'),
            ),
          ),
        ],
      ),
    );
  }
}
