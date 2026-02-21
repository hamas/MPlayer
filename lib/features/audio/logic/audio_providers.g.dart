// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appDatabase)
final appDatabaseProvider = AppDatabaseProvider._();

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'8c69eb46d45206533c176c88a926608e79ca927d';

@ProviderFor(songRepository)
final songRepositoryProvider = SongRepositoryProvider._();

final class SongRepositoryProvider
    extends $FunctionalProvider<SongRepository, SongRepository, SongRepository>
    with $Provider<SongRepository> {
  SongRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'songRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$songRepositoryHash();

  @$internal
  @override
  $ProviderElement<SongRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SongRepository create(Ref ref) {
    return songRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SongRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SongRepository>(value),
    );
  }
}

String _$songRepositoryHash() => r'd167d414ccb1fe6d88926269b6fe79a71454bf27';

@ProviderFor(allSongs)
final allSongsProvider = AllSongsProvider._();

final class AllSongsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Song>>,
          List<Song>,
          Stream<List<Song>>
        >
    with $FutureModifier<List<Song>>, $StreamProvider<List<Song>> {
  AllSongsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allSongsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allSongsHash();

  @$internal
  @override
  $StreamProviderElement<List<Song>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Song>> create(Ref ref) {
    return allSongs(ref);
  }
}

String _$allSongsHash() => r'482d960dcb1d50a57f3e14f1de5d51df96e2cc1f';

@ProviderFor(recentSongs)
final recentSongsProvider = RecentSongsProvider._();

final class RecentSongsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Song>>,
          List<Song>,
          Stream<List<Song>>
        >
    with $FutureModifier<List<Song>>, $StreamProvider<List<Song>> {
  RecentSongsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentSongsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentSongsHash();

  @$internal
  @override
  $StreamProviderElement<List<Song>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Song>> create(Ref ref) {
    return recentSongs(ref);
  }
}

String _$recentSongsHash() => r'38584611eb9510c4290cd1403cc2323d001fb350';

@ProviderFor(audioHandler)
final audioHandlerProvider = AudioHandlerProvider._();

final class AudioHandlerProvider
    extends
        $FunctionalProvider<
          AsyncValue<MPlayerAudioHandler>,
          MPlayerAudioHandler,
          FutureOr<MPlayerAudioHandler>
        >
    with
        $FutureModifier<MPlayerAudioHandler>,
        $FutureProvider<MPlayerAudioHandler> {
  AudioHandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioHandlerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioHandlerHash();

  @$internal
  @override
  $FutureProviderElement<MPlayerAudioHandler> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MPlayerAudioHandler> create(Ref ref) {
    return audioHandler(ref);
  }
}

String _$audioHandlerHash() => r'35dd4a9fa4b51b74ea91a71b35e30eaf1d13a0e2';
