// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Lyrics _$LyricsFromJson(Map<String, dynamic> json) => _Lyrics(
  id: (json['id'] as num).toInt(),
  trackName: json['trackName'] as String,
  artistName: json['artistName'] as String,
  albumName: json['albumName'] as String,
  duration: (json['duration'] as num).toDouble(),
  instrumental: json['instrumental'] as bool,
  plainLyrics: json['plainLyrics'] as String?,
  syncedLyrics: json['syncedLyrics'] as String?,
);

Map<String, dynamic> _$LyricsToJson(_Lyrics instance) => <String, dynamic>{
  'id': instance.id,
  'trackName': instance.trackName,
  'artistName': instance.artistName,
  'albumName': instance.albumName,
  'duration': instance.duration,
  'instrumental': instance.instrumental,
  'plainLyrics': instance.plainLyrics,
  'syncedLyrics': instance.syncedLyrics,
};
