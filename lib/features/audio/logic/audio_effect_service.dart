import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mplayer/features/audio/models/equalizer_settings.dart';
import 'package:mplayer/features/audio/logic/mplayer_audio_handler.dart';
import 'package:mplayer/features/audio/logic/audio_providers.dart';

part 'audio_effect_service.g.dart';

@Riverpod(keepAlive: true)
class AudioEffect extends _$AudioEffect {
  @override
  EqualizerSettings build() {
    return const EqualizerSettings();
  }

  MPlayerAudioHandler? get _handler {
    return ref.watch(audioHandlerProvider).value;
  }

  void toggleEqualizer(bool enabled) {
    state = state.copyWith(enabled: enabled);
    _handler?.equalizer.setEnabled(enabled);
  }

  void updateBand(int index, double gain) {
    final newBands = List<double>.from(state.bands);
    newBands[index] = gain;
    state = state.copyWith(bands: newBands);
    _updateNativeBand(index, gain);
  }

  void updateBassBoost(double value) {
    state = state.copyWith(bassBoost: value);
    _handler?.loudnessEnhancer.setTargetGain(value);
  }

  void updateCrossfadeDuration(double value) {
    state = state.copyWith(crossfadeDuration: value);
    // This value will be read by the handler during track transitions
  }

  void _updateNativeBand(int index, double gain) async {
    final eq = _handler?.equalizer;
    if (eq == null) return;

    final parameters = await eq.parameters;
    if (index < parameters.bands.length) {
      await parameters.bands[index].setGain(gain);
    }
  }

  Future<void> setBands(List<double> gains) async {
    state = state.copyWith(bands: gains);
    final eq = _handler?.equalizer;
    if (eq == null) return;

    final parameters = await eq.parameters;
    for (var i = 0; i < gains.length && i < parameters.bands.length; i++) {
      await parameters.bands[i].setGain(gains[i]);
    }
  }

  Future<void> applyPreset(String name) async {
    final presets = {
      'Flat': [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
      'Rock': [4.0, 3.0, 2.0, 0.0, -1.0, -1.0, 1.0, 2.0, 3.0, 4.0],
      'Pop': [-1.0, 1.0, 2.0, 3.0, 1.0, -1.0, -1.0, -1.0, 0.0, 1.0],
      'Bass Boost': [6.0, 5.0, 4.0, 2.0, 0.0, -1.0, -2.0, -2.0, -1.0, 0.0],
      'Electronic': [4.0, 3.0, 1.0, 0.0, 2.0, 1.0, 0.0, 1.0, 4.0, 5.0],
    };

    final gains = presets[name];
    if (gains != null) {
      await setBands(gains);
    }
  }
}
