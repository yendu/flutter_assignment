// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppStateModel {

 int get index; bool get isLoading; String get searchedText; String? get errorMessage;
/// Create a copy of AppStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateModelCopyWith<AppStateModel> get copyWith => _$AppStateModelCopyWithImpl<AppStateModel>(this as AppStateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStateModel&&(identical(other.index, index) || other.index == index)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.searchedText, searchedText) || other.searchedText == searchedText)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,index,isLoading,searchedText,errorMessage);

@override
String toString() {
  return 'AppStateModel(index: $index, isLoading: $isLoading, searchedText: $searchedText, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AppStateModelCopyWith<$Res>  {
  factory $AppStateModelCopyWith(AppStateModel value, $Res Function(AppStateModel) _then) = _$AppStateModelCopyWithImpl;
@useResult
$Res call({
 int index, bool isLoading, String searchedText, String? errorMessage
});




}
/// @nodoc
class _$AppStateModelCopyWithImpl<$Res>
    implements $AppStateModelCopyWith<$Res> {
  _$AppStateModelCopyWithImpl(this._self, this._then);

  final AppStateModel _self;
  final $Res Function(AppStateModel) _then;

/// Create a copy of AppStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? isLoading = null,Object? searchedText = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,searchedText: null == searchedText ? _self.searchedText : searchedText // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppStateModel].
extension AppStateModelPatterns on AppStateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppStateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppStateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppStateModel value)  $default,){
final _that = this;
switch (_that) {
case _AppStateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppStateModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppStateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  bool isLoading,  String searchedText,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppStateModel() when $default != null:
return $default(_that.index,_that.isLoading,_that.searchedText,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  bool isLoading,  String searchedText,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AppStateModel():
return $default(_that.index,_that.isLoading,_that.searchedText,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  bool isLoading,  String searchedText,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AppStateModel() when $default != null:
return $default(_that.index,_that.isLoading,_that.searchedText,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AppStateModel implements AppStateModel {
  const _AppStateModel({required this.index, required this.isLoading, required this.searchedText, this.errorMessage});
  

@override final  int index;
@override final  bool isLoading;
@override final  String searchedText;
@override final  String? errorMessage;

/// Create a copy of AppStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateModelCopyWith<_AppStateModel> get copyWith => __$AppStateModelCopyWithImpl<_AppStateModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppStateModel&&(identical(other.index, index) || other.index == index)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.searchedText, searchedText) || other.searchedText == searchedText)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,index,isLoading,searchedText,errorMessage);

@override
String toString() {
  return 'AppStateModel(index: $index, isLoading: $isLoading, searchedText: $searchedText, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AppStateModelCopyWith<$Res> implements $AppStateModelCopyWith<$Res> {
  factory _$AppStateModelCopyWith(_AppStateModel value, $Res Function(_AppStateModel) _then) = __$AppStateModelCopyWithImpl;
@override @useResult
$Res call({
 int index, bool isLoading, String searchedText, String? errorMessage
});




}
/// @nodoc
class __$AppStateModelCopyWithImpl<$Res>
    implements _$AppStateModelCopyWith<$Res> {
  __$AppStateModelCopyWithImpl(this._self, this._then);

  final _AppStateModel _self;
  final $Res Function(_AppStateModel) _then;

/// Create a copy of AppStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? isLoading = null,Object? searchedText = null,Object? errorMessage = freezed,}) {
  return _then(_AppStateModel(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,searchedText: null == searchedText ? _self.searchedText : searchedText // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
