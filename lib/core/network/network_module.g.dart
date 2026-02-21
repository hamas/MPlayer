// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dio)
final dioProvider = DioProvider._();

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'253502ac24566ea0ff8d8511eacf028ebe3e1ffd';

@ProviderFor(chopper)
final chopperProvider = ChopperProvider._();

final class ChopperProvider
    extends $FunctionalProvider<ChopperClient, ChopperClient, ChopperClient>
    with $Provider<ChopperClient> {
  ChopperProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chopperProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chopperHash();

  @$internal
  @override
  $ProviderElement<ChopperClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChopperClient create(Ref ref) {
    return chopper(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChopperClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChopperClient>(value),
    );
  }
}

String _$chopperHash() => r'34c1cae8f4519b8a1ebce654d465dcd54b0634d7';

@ProviderFor(lrclibService)
final lrclibServiceProvider = LrclibServiceProvider._();

final class LrclibServiceProvider
    extends $FunctionalProvider<LrclibService, LrclibService, LrclibService>
    with $Provider<LrclibService> {
  LrclibServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lrclibServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lrclibServiceHash();

  @$internal
  @override
  $ProviderElement<LrclibService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LrclibService create(Ref ref) {
    return lrclibService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LrclibService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LrclibService>(value),
    );
  }
}

String _$lrclibServiceHash() => r'012cfe89c3e8c7f1c48e709ecd585c16813fe947';
