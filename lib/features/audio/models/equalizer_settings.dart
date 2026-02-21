import 'package:freezed_annotation/freezed_annotation.dart';

part 'equalizer_settings.freezed.dart';
part 'equalizer_settings.g.dart';

@freezed
abstract class EqualizerSettings with _$EqualizerSettings {
  const factory EqualizerSettings({
    @Default(true) bool enabled,
    @Default([0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
    List<double> bands,
    @Default(0.0) double bassBoost,
    @Default(0.0) double virtualizer,
    @Default(0.0) double crossfadeDuration, // in seconds
  }) = _EqualizerSettings;

  factory EqualizerSettings.fromJson(Map<String, dynamic> json) =>
      _$EqualizerSettingsFromJson(json);
}
