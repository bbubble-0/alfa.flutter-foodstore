// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CartEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CartEvent()';
}


}

/// @nodoc
class $CartEventCopyWith<$Res>  {
$CartEventCopyWith(CartEvent _, $Res Function(CartEvent) __);
}


/// Adds pattern-matching-related methods to [CartEvent].
extension CartEventPatterns on CartEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchCart value)?  fetchCart,TResult Function( _AddCart value)?  addCart,TResult Function( _RemoveCart value)?  removeCart,TResult Function( _Increment value)?  increment,TResult Function( _Decrement value)?  decrement,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchCart() when fetchCart != null:
return fetchCart(_that);case _AddCart() when addCart != null:
return addCart(_that);case _RemoveCart() when removeCart != null:
return removeCart(_that);case _Increment() when increment != null:
return increment(_that);case _Decrement() when decrement != null:
return decrement(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchCart value)  fetchCart,required TResult Function( _AddCart value)  addCart,required TResult Function( _RemoveCart value)  removeCart,required TResult Function( _Increment value)  increment,required TResult Function( _Decrement value)  decrement,}){
final _that = this;
switch (_that) {
case _FetchCart():
return fetchCart(_that);case _AddCart():
return addCart(_that);case _RemoveCart():
return removeCart(_that);case _Increment():
return increment(_that);case _Decrement():
return decrement(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchCart value)?  fetchCart,TResult? Function( _AddCart value)?  addCart,TResult? Function( _RemoveCart value)?  removeCart,TResult? Function( _Increment value)?  increment,TResult? Function( _Decrement value)?  decrement,}){
final _that = this;
switch (_that) {
case _FetchCart() when fetchCart != null:
return fetchCart(_that);case _AddCart() when addCart != null:
return addCart(_that);case _RemoveCart() when removeCart != null:
return removeCart(_that);case _Increment() when increment != null:
return increment(_that);case _Decrement() when decrement != null:
return decrement(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchCart,TResult Function( int productId,  int qty)?  addCart,TResult Function( int cartId)?  removeCart,TResult Function( int productId,  int cartId)?  increment,TResult Function( int productId,  int cartId)?  decrement,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchCart() when fetchCart != null:
return fetchCart();case _AddCart() when addCart != null:
return addCart(_that.productId,_that.qty);case _RemoveCart() when removeCart != null:
return removeCart(_that.cartId);case _Increment() when increment != null:
return increment(_that.productId,_that.cartId);case _Decrement() when decrement != null:
return decrement(_that.productId,_that.cartId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchCart,required TResult Function( int productId,  int qty)  addCart,required TResult Function( int cartId)  removeCart,required TResult Function( int productId,  int cartId)  increment,required TResult Function( int productId,  int cartId)  decrement,}) {final _that = this;
switch (_that) {
case _FetchCart():
return fetchCart();case _AddCart():
return addCart(_that.productId,_that.qty);case _RemoveCart():
return removeCart(_that.cartId);case _Increment():
return increment(_that.productId,_that.cartId);case _Decrement():
return decrement(_that.productId,_that.cartId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchCart,TResult? Function( int productId,  int qty)?  addCart,TResult? Function( int cartId)?  removeCart,TResult? Function( int productId,  int cartId)?  increment,TResult? Function( int productId,  int cartId)?  decrement,}) {final _that = this;
switch (_that) {
case _FetchCart() when fetchCart != null:
return fetchCart();case _AddCart() when addCart != null:
return addCart(_that.productId,_that.qty);case _RemoveCart() when removeCart != null:
return removeCart(_that.cartId);case _Increment() when increment != null:
return increment(_that.productId,_that.cartId);case _Decrement() when decrement != null:
return decrement(_that.productId,_that.cartId);case _:
  return null;

}
}

}

/// @nodoc


class _FetchCart implements CartEvent {
  const _FetchCart();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchCart);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CartEvent.fetchCart()';
}


}




/// @nodoc


class _AddCart implements CartEvent {
  const _AddCart({required this.productId, required this.qty});
  

 final  int productId;
 final  int qty;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCartCopyWith<_AddCart> get copyWith => __$AddCartCopyWithImpl<_AddCart>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddCart&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.qty, qty) || other.qty == qty));
}


@override
int get hashCode {
    return Object.hash(runtimeType,productId,qty);
}

@override
String toString() {
    return 'CartEvent.addCart(productId: $productId, qty: $qty)';
}


}

/// @nodoc
abstract mixin class _$AddCartCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory _$AddCartCopyWith(_AddCart value, $Res Function(_AddCart) _then) = __$AddCartCopyWithImpl;
@useResult
$Res call({
 int productId, int qty
});




}
/// @nodoc
class __$AddCartCopyWithImpl<$Res>
    implements _$AddCartCopyWith<$Res> {
  __$AddCartCopyWithImpl(this._self, this._then);

  final _AddCart _self;
  final $Res Function(_AddCart) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? qty = null,}) {
  return _then(_AddCart(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _RemoveCart implements CartEvent {
  const _RemoveCart(this.cartId);
  

 final  int cartId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveCartCopyWith<_RemoveCart> get copyWith => __$RemoveCartCopyWithImpl<_RemoveCart>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveCart&&(identical(other.cartId, cartId) || other.cartId == cartId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,cartId);
}

@override
String toString() {
    return 'CartEvent.removeCart(cartId: $cartId)';
}


}

/// @nodoc
abstract mixin class _$RemoveCartCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory _$RemoveCartCopyWith(_RemoveCart value, $Res Function(_RemoveCart) _then) = __$RemoveCartCopyWithImpl;
@useResult
$Res call({
 int cartId
});




}
/// @nodoc
class __$RemoveCartCopyWithImpl<$Res>
    implements _$RemoveCartCopyWith<$Res> {
  __$RemoveCartCopyWithImpl(this._self, this._then);

  final _RemoveCart _self;
  final $Res Function(_RemoveCart) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cartId = null,}) {
  return _then(_RemoveCart(
null == cartId ? _self.cartId : cartId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Increment implements CartEvent {
  const _Increment({required this.productId, required this.cartId});
  

 final  int productId;
 final  int cartId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncrementCopyWith<_Increment> get copyWith => __$IncrementCopyWithImpl<_Increment>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Increment&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.cartId, cartId) || other.cartId == cartId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,productId,cartId);
}

@override
String toString() {
    return 'CartEvent.increment(productId: $productId, cartId: $cartId)';
}


}

/// @nodoc
abstract mixin class _$IncrementCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory _$IncrementCopyWith(_Increment value, $Res Function(_Increment) _then) = __$IncrementCopyWithImpl;
@useResult
$Res call({
 int productId, int cartId
});




}
/// @nodoc
class __$IncrementCopyWithImpl<$Res>
    implements _$IncrementCopyWith<$Res> {
  __$IncrementCopyWithImpl(this._self, this._then);

  final _Increment _self;
  final $Res Function(_Increment) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? cartId = null,}) {
  return _then(_Increment(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,cartId: null == cartId ? _self.cartId : cartId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Decrement implements CartEvent {
  const _Decrement({required this.productId, required this.cartId});
  

 final  int productId;
 final  int cartId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DecrementCopyWith<_Decrement> get copyWith => __$DecrementCopyWithImpl<_Decrement>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Decrement&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.cartId, cartId) || other.cartId == cartId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,productId,cartId);
}

@override
String toString() {
    return 'CartEvent.decrement(productId: $productId, cartId: $cartId)';
}


}

/// @nodoc
abstract mixin class _$DecrementCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory _$DecrementCopyWith(_Decrement value, $Res Function(_Decrement) _then) = __$DecrementCopyWithImpl;
@useResult
$Res call({
 int productId, int cartId
});




}
/// @nodoc
class __$DecrementCopyWithImpl<$Res>
    implements _$DecrementCopyWith<$Res> {
  __$DecrementCopyWithImpl(this._self, this._then);

  final _Decrement _self;
  final $Res Function(_Decrement) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? cartId = null,}) {
  return _then(_Decrement(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,cartId: null == cartId ? _self.cartId : cartId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CartState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CartState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CartState()';
}


}

/// @nodoc
class $CartStateCopyWith<$Res>  {
$CartStateCopyWith(CartState _, $Res Function(CartState) __);
}


/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Stored value)?  stored,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Stored() when stored != null:
return stored(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Stored value)  stored,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Stored():
return stored(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Stored value)?  stored,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Stored() when stored != null:
return stored(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( CartResponseModel cartResponse)?  loaded,TResult Function( String message)?  stored,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.cartResponse);case _Stored() when stored != null:
return stored(_that.message);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( CartResponseModel cartResponse)  loaded,required TResult Function( String message)  stored,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.cartResponse);case _Stored():
return stored(_that.message);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( CartResponseModel cartResponse)?  loaded,TResult? Function( String message)?  stored,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.cartResponse);case _Stored() when stored != null:
return stored(_that.message);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CartState {
  const _Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CartState.initial()';
}


}




/// @nodoc


class _Loading implements CartState {
  const _Loading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CartState.loading()';
}


}




/// @nodoc


class _Loaded implements CartState {
  const _Loaded(this.cartResponse);
  

 final  CartResponseModel cartResponse;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.cartResponse, cartResponse) || other.cartResponse == cartResponse));
}


@override
int get hashCode {
    return Object.hash(runtimeType,cartResponse);
}

@override
String toString() {
    return 'CartState.loaded(cartResponse: $cartResponse)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 CartResponseModel cartResponse
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cartResponse = null,}) {
  return _then(_Loaded(
null == cartResponse ? _self.cartResponse : cartResponse // ignore: cast_nullable_to_non_nullable
as CartResponseModel,
  ));
}


}

/// @nodoc


class _Stored implements CartState {
  const _Stored(this.message);
  

 final  String message;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoredCopyWith<_Stored> get copyWith => __$StoredCopyWithImpl<_Stored>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Stored&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'CartState.stored(message: $message)';
}


}

/// @nodoc
abstract mixin class _$StoredCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$StoredCopyWith(_Stored value, $Res Function(_Stored) _then) = __$StoredCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$StoredCopyWithImpl<$Res>
    implements _$StoredCopyWith<$Res> {
  __$StoredCopyWithImpl(this._self, this._then);

  final _Stored _self;
  final $Res Function(_Stored) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Stored(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Error implements CartState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'CartState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
