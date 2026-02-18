import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:audio_service/audio_service.dart';

part 'song.freezed.dart';
part 'song.g.dart';

@freezed
abstract class Song with _$Song {
  const factory Song({
    required String id,
    required String title,
    required String artist,
    required String album,
    required String uri,
    @Default(0) int duration,
    @Default(0) int size,
    String? artworkUri,
    @Default(false) bool isFavorite,
    @Default(0) int playCount,
    DateTime? dateAdded,
  }) = _Song;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}

extension SongExtension on Song {
  MediaItem toMediaItem() {
    return MediaItem(
      id: uri, // Use URI as ID for now as that's what we use for AudioSource
      title: title,
      artist: artist,
      album: album,
      duration: Duration(milliseconds: duration),
      artUri: artworkUri != null ? Uri.parse(artworkUri!) : null,
      extras: {'dbId': id},
    );
  }
}
