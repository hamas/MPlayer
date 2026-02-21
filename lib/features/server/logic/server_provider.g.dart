// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localServer)
final localServerProvider = LocalServerProvider._();

final class LocalServerProvider
    extends $FunctionalProvider<LocalServer, LocalServer, LocalServer>
    with $Provider<LocalServer> {
  LocalServerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localServerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localServerHash();

  @$internal
  @override
  $ProviderElement<LocalServer> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocalServer create(Ref ref) {
    return localServer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalServer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalServer>(value),
    );
  }
}

String _$localServerHash() => r'c3c4c4b6418d112786fc2a95241520df3352bff9';

@ProviderFor(ServerStatus)
final serverStatusProvider = ServerStatusProvider._();

final class ServerStatusProvider extends $NotifierProvider<ServerStatus, bool> {
  ServerStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverStatusHash();

  @$internal
  @override
  ServerStatus create() => ServerStatus();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$serverStatusHash() => r'ce0cf0db09d175b9940df8a296782c4863b8feb6';

abstract class _$ServerStatus extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
