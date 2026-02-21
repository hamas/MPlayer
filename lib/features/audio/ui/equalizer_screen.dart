import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/features/audio/logic/audio_effect_service.dart';

class EqualizerScreen extends ConsumerWidget {
  const EqualizerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(audioEffectProvider);
    final service = ref.read(audioEffectProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Equalizer'),
        actions: [
          Switch(
            value: settings.enabled,
            onChanged: (val) => service.toggleEqualizer(val),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Frequency Bands',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: settings.bands.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Slider(
                              value: settings.bands[index],
                              min: -15.0,
                              max: 15.0,
                              onChanged: settings.enabled
                                  ? (val) => service.updateBand(index, val)
                                  : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(_getFreqLabel(index)),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Presets',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: ['Flat', 'Rock', 'Pop', 'Bass Boost', 'Electronic'].map((
                name,
              ) {
                return ChoiceChip(
                  label: Text(name),
                  selected:
                      false, // For simplicity, we don't track active preset name yet
                  onSelected: (val) => val ? service.applyPreset(name) : null,
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            const Text(
              'Effects',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('Bass Boost / Gain'),
              subtitle: Slider(
                value: settings.bassBoost,
                min: 0.0,
                max: 1000.0,
                onChanged: settings.enabled
                    ? (val) => service.updateBassBoost(val)
                    : null,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('Crossfade Duration'),
              subtitle: Column(
                children: [
                  Slider(
                    value: settings.crossfadeDuration,
                    min: 0.0,
                    max: 10.0,
                    divisions: 10,
                    label: '${settings.crossfadeDuration.toInt()}s',
                    onChanged: (val) => service.updateCrossfadeDuration(val),
                  ),
                  Text('${settings.crossfadeDuration.toInt()} seconds'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getFreqLabel(int index) {
    const labels = [
      '31Hz',
      '62Hz',
      '125Hz',
      '250Hz',
      '500Hz',
      '1kHz',
      '2kHz',
      '4kHz',
      '8kHz',
      '16kHz',
    ];
    if (index < labels.length) return labels[index];
    return '${index + 1}';
  }
}
