// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Song _$SongFromJson(Map<String, dynamic> json) => _Song(
  id: json['id'] as String,
  title: json['title'] as String,
  artist: json['artist'] as String,
  album: json['album'] as String,
  uri: json['uri'] as String,
  duration: (json['duration'] as num?)?.toInt() ?? 0,
  size: (json['size'] as num?)?.toInt() ?? 0,
  artworkUri: json['artworkUri'] as String?,
  isFavorite: json['isFavorite'] as bool? ?? false,
  playCount: (json['playCount'] as num?)?.toInt() ?? 0,
  skipCount: (json['skipCount'] as num?)?.toInt() ?? 0,
  dateAdded: json['dateAdded'] == null
      ? null
      : DateTime.parse(json['dateAdded'] as String),
);

Map<String, dynamic> _$SongToJson(_Song instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'artist': instance.artist,
  'album': instance.album,
  'uri': instance.uri,
  'duration': instance.duration,
  'size': instance.size,
  'artworkUri': instance.artworkUri,
  'isFavorite': instance.isFavorite,
  'playCount': instance.playCount,
  'skipCount': instance.skipCount,
  'dateAdded': instance.dateAdded?.toIso8601String(),
};
