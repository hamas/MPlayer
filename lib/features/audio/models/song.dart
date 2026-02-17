import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';
part 'song.g.dart';

@freezed
class Song with _$Song {
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
