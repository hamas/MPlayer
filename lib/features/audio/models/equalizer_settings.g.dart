// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equalizer_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EqualizerSettings _$EqualizerSettingsFromJson(Map<String, dynamic> json) =>
    _EqualizerSettings(
      enabled: json['enabled'] as bool? ?? true,
      bands:
          (json['bands'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
      bassBoost: (json['bassBoost'] as num?)?.toDouble() ?? 0.0,
      virtualizer: (json['virtualizer'] as num?)?.toDouble() ?? 0.0,
      crossfadeDuration: (json['crossfadeDuration'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$EqualizerSettingsToJson(_EqualizerSettings instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'bands': instance.bands,
      'bassBoost': instance.bassBoost,
      'virtualizer': instance.virtualizer,
      'crossfadeDuration': instance.crossfadeDuration,
    };
