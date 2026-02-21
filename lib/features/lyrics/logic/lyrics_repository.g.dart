// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyrics_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(lyricsRepository)
final lyricsRepositoryProvider = LyricsRepositoryProvider._();

final class LyricsRepositoryProvider
    extends
        $FunctionalProvider<
          LyricsRepository,
          LyricsRepository,
          LyricsRepository
        >
    with $Provider<LyricsRepository> {
  LyricsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lyricsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lyricsRepositoryHash();

  @$internal
  @override
  $ProviderElement<LyricsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LyricsRepository create(Ref ref) {
    return lyricsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LyricsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LyricsRepository>(value),
    );
  }
}

String _$lyricsRepositoryHash() => r'3df2838b4641f951a460095097e714de8f2cb7f5';
