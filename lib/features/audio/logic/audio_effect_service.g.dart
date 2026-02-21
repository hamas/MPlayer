// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_effect_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AudioEffect)
final audioEffectProvider = AudioEffectProvider._();

final class AudioEffectProvider
    extends $NotifierProvider<AudioEffect, EqualizerSettings> {
  AudioEffectProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioEffectProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioEffectHash();

  @$internal
  @override
  AudioEffect create() => AudioEffect();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EqualizerSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EqualizerSettings>(value),
    );
  }
}

String _$audioEffectHash() => r'9e834cf3f772495bf18236c9585a1b023b078e81';

abstract class _$AudioEffect extends $Notifier<EqualizerSettings> {
  EqualizerSettings build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<EqualizerSettings, EqualizerSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EqualizerSettings, EqualizerSettings>,
              EqualizerSettings,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
