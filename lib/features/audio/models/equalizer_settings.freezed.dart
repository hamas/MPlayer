// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equalizer_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EqualizerSettings {

 bool get enabled; List<double> get bands; double get bassBoost; double get virtualizer; double get crossfadeDuration;
/// Create a copy of EqualizerSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EqualizerSettingsCopyWith<EqualizerSettings> get copyWith => _$EqualizerSettingsCopyWithImpl<EqualizerSettings>(this as EqualizerSettings, _$identity);

  /// Serializes this EqualizerSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EqualizerSettings&&(identical(other.enabled, enabled) || other.enabled == enabled)&&const DeepCollectionEquality().equals(other.bands, bands)&&(identical(other.bassBoost, bassBoost) || other.bassBoost == bassBoost)&&(identical(other.virtualizer, virtualizer) || other.virtualizer == virtualizer)&&(identical(other.crossfadeDuration, crossfadeDuration) || other.crossfadeDuration == crossfadeDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,const DeepCollectionEquality().hash(bands),bassBoost,virtualizer,crossfadeDuration);

@override
String toString() {
  return 'EqualizerSettings(enabled: $enabled, bands: $bands, bassBoost: $bassBoost, virtualizer: $virtualizer, crossfadeDuration: $crossfadeDuration)';
}


}

/// @nodoc
abstract mixin class $EqualizerSettingsCopyWith<$Res>  {
  factory $EqualizerSettingsCopyWith(EqualizerSettings value, $Res Function(EqualizerSettings) _then) = _$EqualizerSettingsCopyWithImpl;
@useResult
$Res call({
 bool enabled, List<double> bands, double bassBoost, double virtualizer, double crossfadeDuration
});




}
/// @nodoc
class _$EqualizerSettingsCopyWithImpl<$Res>
    implements $EqualizerSettingsCopyWith<$Res> {
  _$EqualizerSettingsCopyWithImpl(this._self, this._then);

  final EqualizerSettings _self;
  final $Res Function(EqualizerSettings) _then;

/// Create a copy of EqualizerSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? bands = null,Object? bassBoost = null,Object? virtualizer = null,Object? crossfadeDuration = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,bands: null == bands ? _self.bands : bands // ignore: cast_nullable_to_non_nullable
as List<double>,bassBoost: null == bassBoost ? _self.bassBoost : bassBoost // ignore: cast_nullable_to_non_nullable
as double,virtualizer: null == virtualizer ? _self.virtualizer : virtualizer // ignore: cast_nullable_to_non_nullable
as double,crossfadeDuration: null == crossfadeDuration ? _self.crossfadeDuration : crossfadeDuration // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [EqualizerSettings].
extension EqualizerSettingsPatterns on EqualizerSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EqualizerSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EqualizerSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EqualizerSettings value)  $default,){
final _that = this;
switch (_that) {
case _EqualizerSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EqualizerSettings value)?  $default,){
final _that = this;
switch (_that) {
case _EqualizerSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled,  List<double> bands,  double bassBoost,  double virtualizer,  double crossfadeDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EqualizerSettings() when $default != null:
return $default(_that.enabled,_that.bands,_that.bassBoost,_that.virtualizer,_that.crossfadeDuration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled,  List<double> bands,  double bassBoost,  double virtualizer,  double crossfadeDuration)  $default,) {final _that = this;
switch (_that) {
case _EqualizerSettings():
return $default(_that.enabled,_that.bands,_that.bassBoost,_that.virtualizer,_that.crossfadeDuration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled,  List<double> bands,  double bassBoost,  double virtualizer,  double crossfadeDuration)?  $default,) {final _that = this;
switch (_that) {
case _EqualizerSettings() when $default != null:
return $default(_that.enabled,_that.bands,_that.bassBoost,_that.virtualizer,_that.crossfadeDuration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EqualizerSettings implements EqualizerSettings {
  const _EqualizerSettings({this.enabled = true, final  List<double> bands = const [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], this.bassBoost = 0.0, this.virtualizer = 0.0, this.crossfadeDuration = 0.0}): _bands = bands;
  factory _EqualizerSettings.fromJson(Map<String, dynamic> json) => _$EqualizerSettingsFromJson(json);

@override@JsonKey() final  bool enabled;
 final  List<double> _bands;
@override@JsonKey() List<double> get bands {
  if (_bands is EqualUnmodifiableListView) return _bands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bands);
}

@override@JsonKey() final  double bassBoost;
@override@JsonKey() final  double virtualizer;
@override@JsonKey() final  double crossfadeDuration;

/// Create a copy of EqualizerSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EqualizerSettingsCopyWith<_EqualizerSettings> get copyWith => __$EqualizerSettingsCopyWithImpl<_EqualizerSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EqualizerSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EqualizerSettings&&(identical(other.enabled, enabled) || other.enabled == enabled)&&const DeepCollectionEquality().equals(other._bands, _bands)&&(identical(other.bassBoost, bassBoost) || other.bassBoost == bassBoost)&&(identical(other.virtualizer, virtualizer) || other.virtualizer == virtualizer)&&(identical(other.crossfadeDuration, crossfadeDuration) || other.crossfadeDuration == crossfadeDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,const DeepCollectionEquality().hash(_bands),bassBoost,virtualizer,crossfadeDuration);

@override
String toString() {
  return 'EqualizerSettings(enabled: $enabled, bands: $bands, bassBoost: $bassBoost, virtualizer: $virtualizer, crossfadeDuration: $crossfadeDuration)';
}


}

/// @nodoc
abstract mixin class _$EqualizerSettingsCopyWith<$Res> implements $EqualizerSettingsCopyWith<$Res> {
  factory _$EqualizerSettingsCopyWith(_EqualizerSettings value, $Res Function(_EqualizerSettings) _then) = __$EqualizerSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool enabled, List<double> bands, double bassBoost, double virtualizer, double crossfadeDuration
});




}
/// @nodoc
class __$EqualizerSettingsCopyWithImpl<$Res>
    implements _$EqualizerSettingsCopyWith<$Res> {
  __$EqualizerSettingsCopyWithImpl(this._self, this._then);

  final _EqualizerSettings _self;
  final $Res Function(_EqualizerSettings) _then;

/// Create a copy of EqualizerSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? bands = null,Object? bassBoost = null,Object? virtualizer = null,Object? crossfadeDuration = null,}) {
  return _then(_EqualizerSettings(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,bands: null == bands ? _self._bands : bands // ignore: cast_nullable_to_non_nullable
as List<double>,bassBoost: null == bassBoost ? _self.bassBoost : bassBoost // ignore: cast_nullable_to_non_nullable
as double,virtualizer: null == virtualizer ? _self.virtualizer : virtualizer // ignore: cast_nullable_to_non_nullable
as double,crossfadeDuration: null == crossfadeDuration ? _self.crossfadeDuration : crossfadeDuration // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
