// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Lyrics {

 int get id; String get trackName; String get artistName; String get albumName; double get duration; bool get instrumental; String? get plainLyrics; String? get syncedLyrics;
/// Create a copy of Lyrics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LyricsCopyWith<Lyrics> get copyWith => _$LyricsCopyWithImpl<Lyrics>(this as Lyrics, _$identity);

  /// Serializes this Lyrics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Lyrics&&(identical(other.id, id) || other.id == id)&&(identical(other.trackName, trackName) || other.trackName == trackName)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instrumental, instrumental) || other.instrumental == instrumental)&&(identical(other.plainLyrics, plainLyrics) || other.plainLyrics == plainLyrics)&&(identical(other.syncedLyrics, syncedLyrics) || other.syncedLyrics == syncedLyrics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,trackName,artistName,albumName,duration,instrumental,plainLyrics,syncedLyrics);

@override
String toString() {
  return 'Lyrics(id: $id, trackName: $trackName, artistName: $artistName, albumName: $albumName, duration: $duration, instrumental: $instrumental, plainLyrics: $plainLyrics, syncedLyrics: $syncedLyrics)';
}


}

/// @nodoc
abstract mixin class $LyricsCopyWith<$Res>  {
  factory $LyricsCopyWith(Lyrics value, $Res Function(Lyrics) _then) = _$LyricsCopyWithImpl;
@useResult
$Res call({
 int id, String trackName, String artistName, String albumName, double duration, bool instrumental, String? plainLyrics, String? syncedLyrics
});




}
/// @nodoc
class _$LyricsCopyWithImpl<$Res>
    implements $LyricsCopyWith<$Res> {
  _$LyricsCopyWithImpl(this._self, this._then);

  final Lyrics _self;
  final $Res Function(Lyrics) _then;

/// Create a copy of Lyrics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? trackName = null,Object? artistName = null,Object? albumName = null,Object? duration = null,Object? instrumental = null,Object? plainLyrics = freezed,Object? syncedLyrics = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,trackName: null == trackName ? _self.trackName : trackName // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,albumName: null == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double,instrumental: null == instrumental ? _self.instrumental : instrumental // ignore: cast_nullable_to_non_nullable
as bool,plainLyrics: freezed == plainLyrics ? _self.plainLyrics : plainLyrics // ignore: cast_nullable_to_non_nullable
as String?,syncedLyrics: freezed == syncedLyrics ? _self.syncedLyrics : syncedLyrics // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Lyrics].
extension LyricsPatterns on Lyrics {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Lyrics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Lyrics() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Lyrics value)  $default,){
final _that = this;
switch (_that) {
case _Lyrics():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Lyrics value)?  $default,){
final _that = this;
switch (_that) {
case _Lyrics() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String trackName,  String artistName,  String albumName,  double duration,  bool instrumental,  String? plainLyrics,  String? syncedLyrics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Lyrics() when $default != null:
return $default(_that.id,_that.trackName,_that.artistName,_that.albumName,_that.duration,_that.instrumental,_that.plainLyrics,_that.syncedLyrics);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String trackName,  String artistName,  String albumName,  double duration,  bool instrumental,  String? plainLyrics,  String? syncedLyrics)  $default,) {final _that = this;
switch (_that) {
case _Lyrics():
return $default(_that.id,_that.trackName,_that.artistName,_that.albumName,_that.duration,_that.instrumental,_that.plainLyrics,_that.syncedLyrics);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String trackName,  String artistName,  String albumName,  double duration,  bool instrumental,  String? plainLyrics,  String? syncedLyrics)?  $default,) {final _that = this;
switch (_that) {
case _Lyrics() when $default != null:
return $default(_that.id,_that.trackName,_that.artistName,_that.albumName,_that.duration,_that.instrumental,_that.plainLyrics,_that.syncedLyrics);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Lyrics implements Lyrics {
  const _Lyrics({required this.id, required this.trackName, required this.artistName, required this.albumName, required this.duration, required this.instrumental, this.plainLyrics, this.syncedLyrics});
  factory _Lyrics.fromJson(Map<String, dynamic> json) => _$LyricsFromJson(json);

@override final  int id;
@override final  String trackName;
@override final  String artistName;
@override final  String albumName;
@override final  double duration;
@override final  bool instrumental;
@override final  String? plainLyrics;
@override final  String? syncedLyrics;

/// Create a copy of Lyrics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LyricsCopyWith<_Lyrics> get copyWith => __$LyricsCopyWithImpl<_Lyrics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LyricsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Lyrics&&(identical(other.id, id) || other.id == id)&&(identical(other.trackName, trackName) || other.trackName == trackName)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instrumental, instrumental) || other.instrumental == instrumental)&&(identical(other.plainLyrics, plainLyrics) || other.plainLyrics == plainLyrics)&&(identical(other.syncedLyrics, syncedLyrics) || other.syncedLyrics == syncedLyrics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,trackName,artistName,albumName,duration,instrumental,plainLyrics,syncedLyrics);

@override
String toString() {
  return 'Lyrics(id: $id, trackName: $trackName, artistName: $artistName, albumName: $albumName, duration: $duration, instrumental: $instrumental, plainLyrics: $plainLyrics, syncedLyrics: $syncedLyrics)';
}


}

/// @nodoc
abstract mixin class _$LyricsCopyWith<$Res> implements $LyricsCopyWith<$Res> {
  factory _$LyricsCopyWith(_Lyrics value, $Res Function(_Lyrics) _then) = __$LyricsCopyWithImpl;
@override @useResult
$Res call({
 int id, String trackName, String artistName, String albumName, double duration, bool instrumental, String? plainLyrics, String? syncedLyrics
});




}
/// @nodoc
class __$LyricsCopyWithImpl<$Res>
    implements _$LyricsCopyWith<$Res> {
  __$LyricsCopyWithImpl(this._self, this._then);

  final _Lyrics _self;
  final $Res Function(_Lyrics) _then;

/// Create a copy of Lyrics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? trackName = null,Object? artistName = null,Object? albumName = null,Object? duration = null,Object? instrumental = null,Object? plainLyrics = freezed,Object? syncedLyrics = freezed,}) {
  return _then(_Lyrics(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,trackName: null == trackName ? _self.trackName : trackName // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,albumName: null == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double,instrumental: null == instrumental ? _self.instrumental : instrumental // ignore: cast_nullable_to_non_nullable
as bool,plainLyrics: freezed == plainLyrics ? _self.plainLyrics : plainLyrics // ignore: cast_nullable_to_non_nullable
as String?,syncedLyrics: freezed == syncedLyrics ? _self.syncedLyrics : syncedLyrics // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
