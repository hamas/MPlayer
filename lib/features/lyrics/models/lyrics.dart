import 'package:freezed_annotation/freezed_annotation.dart';

part 'lyrics.freezed.dart';
part 'lyrics.g.dart';

@freezed
abstract class Lyrics with _$Lyrics {
  const factory Lyrics({
    required int id,
    required String trackName,
    required String artistName,
    required String albumName,
    required double duration,
    required bool instrumental,
    String? plainLyrics,
    String? syncedLyrics,
  }) = _Lyrics;

  factory Lyrics.fromJson(Map<String, dynamic> json) => _$LyricsFromJson(json);
}
