// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadProfile value)?  loadProfile,TResult Function( UpdateProfile value)?  updateProfile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadProfile() when loadProfile != null:
return loadProfile(_that);case UpdateProfile() when updateProfile != null:
return updateProfile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadProfile value)  loadProfile,required TResult Function( UpdateProfile value)  updateProfile,}){
final _that = this;
switch (_that) {
case LoadProfile():
return loadProfile(_that);case UpdateProfile():
return updateProfile(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadProfile value)?  loadProfile,TResult? Function( UpdateProfile value)?  updateProfile,}){
final _that = this;
switch (_that) {
case LoadProfile() when loadProfile != null:
return loadProfile(_that);case UpdateProfile() when updateProfile != null:
return updateProfile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadProfile,TResult Function( String name,  String email,  File? image,  String? password,  String? passwordConfirmation)?  updateProfile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadProfile() when loadProfile != null:
return loadProfile();case UpdateProfile() when updateProfile != null:
return updateProfile(_that.name,_that.email,_that.image,_that.password,_that.passwordConfirmation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadProfile,required TResult Function( String name,  String email,  File? image,  String? password,  String? passwordConfirmation)  updateProfile,}) {final _that = this;
switch (_that) {
case LoadProfile():
return loadProfile();case UpdateProfile():
return updateProfile(_that.name,_that.email,_that.image,_that.password,_that.passwordConfirmation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadProfile,TResult? Function( String name,  String email,  File? image,  String? password,  String? passwordConfirmation)?  updateProfile,}) {final _that = this;
switch (_that) {
case LoadProfile() when loadProfile != null:
return loadProfile();case UpdateProfile() when updateProfile != null:
return updateProfile(_that.name,_that.email,_that.image,_that.password,_that.passwordConfirmation);case _:
  return null;

}
}

}

/// @nodoc


class LoadProfile implements ProfileEvent {
  const LoadProfile();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProfileEvent.loadProfile()';
}


}




/// @nodoc


class UpdateProfile implements ProfileEvent {
  const UpdateProfile({required this.name, required this.email, this.image, this.password, this.passwordConfirmation});
  

 final  String name;
 final  String email;
 final  File? image;
 final  String? password;
 final  String? passwordConfirmation;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileCopyWith<UpdateProfile> get copyWith => _$UpdateProfileCopyWithImpl<UpdateProfile>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.image, image) || other.image == image)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirmation, passwordConfirmation) || other.passwordConfirmation == passwordConfirmation));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,email,image,password,passwordConfirmation);
}

@override
String toString() {
    return 'ProfileEvent.updateProfile(name: $name, email: $email, image: $image, password: $password, passwordConfirmation: $passwordConfirmation)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $UpdateProfileCopyWith(UpdateProfile value, $Res Function(UpdateProfile) _then) = _$UpdateProfileCopyWithImpl;
@useResult
$Res call({
 String name, String email, File? image, String? password, String? passwordConfirmation
});




}
/// @nodoc
class _$UpdateProfileCopyWithImpl<$Res>
    implements $UpdateProfileCopyWith<$Res> {
  _$UpdateProfileCopyWithImpl(this._self, this._then);

  final UpdateProfile _self;
  final $Res Function(UpdateProfile) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? image = freezed,Object? password = freezed,Object? passwordConfirmation = freezed,}) {
  return _then(UpdateProfile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,passwordConfirmation: freezed == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ProfileState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProfileState()';
}


}

/// @nodoc
class $ProfileStateCopyWith<$Res>  {
$ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( LoadedProfile value)?  loadedProfile,TResult Function( UpdatedProfile value)?  updatedProfile,TResult Function( Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case LoadedProfile() when loadedProfile != null:
return loadedProfile(_that);case UpdatedProfile() when updatedProfile != null:
return updatedProfile(_that);case Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( LoadedProfile value)  loadedProfile,required TResult Function( UpdatedProfile value)  updatedProfile,required TResult Function( Failure value)  failure,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case LoadedProfile():
return loadedProfile(_that);case UpdatedProfile():
return updatedProfile(_that);case Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( LoadedProfile value)?  loadedProfile,TResult? Function( UpdatedProfile value)?  updatedProfile,TResult? Function( Failure value)?  failure,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case LoadedProfile() when loadedProfile != null:
return loadedProfile(_that);case UpdatedProfile() when updatedProfile != null:
return updatedProfile(_that);case Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( CustomerModel profile)?  loadedProfile,TResult Function( String message)?  updatedProfile,TResult Function( Map<String, dynamic> error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case LoadedProfile() when loadedProfile != null:
return loadedProfile(_that.profile);case UpdatedProfile() when updatedProfile != null:
return updatedProfile(_that.message);case Failure() when failure != null:
return failure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( CustomerModel profile)  loadedProfile,required TResult Function( String message)  updatedProfile,required TResult Function( Map<String, dynamic> error)  failure,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case LoadedProfile():
return loadedProfile(_that.profile);case UpdatedProfile():
return updatedProfile(_that.message);case Failure():
return failure(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( CustomerModel profile)?  loadedProfile,TResult? Function( String message)?  updatedProfile,TResult? Function( Map<String, dynamic> error)?  failure,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case LoadedProfile() when loadedProfile != null:
return loadedProfile(_that.profile);case UpdatedProfile() when updatedProfile != null:
return updatedProfile(_that.message);case Failure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements ProfileState {
  const Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProfileState.initial()';
}


}




/// @nodoc


class Loading implements ProfileState {
  const Loading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProfileState.loading()';
}


}




/// @nodoc


class LoadedProfile implements ProfileState {
  const LoadedProfile(this.profile);
  

 final  CustomerModel profile;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedProfileCopyWith<LoadedProfile> get copyWith => _$LoadedProfileCopyWithImpl<LoadedProfile>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedProfile&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode {
    return Object.hash(runtimeType,profile);
}

@override
String toString() {
    return 'ProfileState.loadedProfile(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $LoadedProfileCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $LoadedProfileCopyWith(LoadedProfile value, $Res Function(LoadedProfile) _then) = _$LoadedProfileCopyWithImpl;
@useResult
$Res call({
 CustomerModel profile
});




}
/// @nodoc
class _$LoadedProfileCopyWithImpl<$Res>
    implements $LoadedProfileCopyWith<$Res> {
  _$LoadedProfileCopyWithImpl(this._self, this._then);

  final LoadedProfile _self;
  final $Res Function(LoadedProfile) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(LoadedProfile(
null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as CustomerModel,
  ));
}


}

/// @nodoc


class UpdatedProfile implements ProfileState {
  const UpdatedProfile(this.message);
  

 final  String message;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatedProfileCopyWith<UpdatedProfile> get copyWith => _$UpdatedProfileCopyWithImpl<UpdatedProfile>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatedProfile&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'ProfileState.updatedProfile(message: $message)';
}


}

/// @nodoc
abstract mixin class $UpdatedProfileCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $UpdatedProfileCopyWith(UpdatedProfile value, $Res Function(UpdatedProfile) _then) = _$UpdatedProfileCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UpdatedProfileCopyWithImpl<$Res>
    implements $UpdatedProfileCopyWith<$Res> {
  _$UpdatedProfileCopyWithImpl(this._self, this._then);

  final UpdatedProfile _self;
  final $Res Function(UpdatedProfile) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UpdatedProfile(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Failure implements ProfileState {
  const Failure({required  Map<String, dynamic> error}): _error = error;
  

 final  Map<String, dynamic> _error;
 Map<String, dynamic> get error {
  if (_error is EqualUnmodifiableMapView) return _error;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_error);
}


/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&const DeepCollectionEquality().equals(other.error, _error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_error));
}

@override
String toString() {
    return 'ProfileState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> error
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(Failure(
error: null == error ? _self._error : error // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
