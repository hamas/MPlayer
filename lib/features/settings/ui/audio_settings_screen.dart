import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AudioSettingsScreen extends ConsumerStatefulWidget {
  const AudioSettingsScreen({super.key});

  @override
  ConsumerState<AudioSettingsScreen> createState() =>
      _AudioSettingsScreenState();
}

class _AudioSettingsScreenState extends ConsumerState<AudioSettingsScreen> {
  double _crossfadeDuration = 0.0;
  bool _gaplessPlayback = true;
  bool _skipSilence = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced Audio')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: const Text('Gapless Playback'),
            subtitle: const Text('Eliminate gaps between consecutive tracks'),
            value: _gaplessPlayback,
            onChanged: (val) {
              setState(() => _gaplessPlayback = val);
              // TODO: Sync to Drift SettingsTable or SharedPreferences
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Skip Silence'),
            subtitle: const Text('Automatically skip silent sections in audio'),
            value: _skipSilence,
            onChanged: (val) {
              setState(() => _skipSilence = val);
              // TODO: Requires JustAudio skipSilenceEnabled
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Crossfade Duration',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '${_crossfadeDuration.toStringAsFixed(1)}s',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Fade out current track while fading in the next track.',
                ),
                Slider(
                  value: _crossfadeDuration,
                  min: 0.0,
                  max: 12.0,
                  divisions: 24,
                  onChanged: (val) {
                    setState(() => _crossfadeDuration = val);
                  },
                  onChangeEnd: (val) {
                    // TODO: Sync to AudioHandler
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
