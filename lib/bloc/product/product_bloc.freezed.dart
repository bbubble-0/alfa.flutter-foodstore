// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProductEvent()';
}


}

/// @nodoc
class $ProductEventCopyWith<$Res>  {
$ProductEventCopyWith(ProductEvent _, $Res Function(ProductEvent) __);
}


/// Adds pattern-matching-related methods to [ProductEvent].
extension ProductEventPatterns on ProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchProducts value)?  fetchProducts,TResult Function( _FetchProductDetail value)?  fetchProductDetail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchProducts() when fetchProducts != null:
return fetchProducts(_that);case _FetchProductDetail() when fetchProductDetail != null:
return fetchProductDetail(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchProducts value)  fetchProducts,required TResult Function( _FetchProductDetail value)  fetchProductDetail,}){
final _that = this;
switch (_that) {
case _FetchProducts():
return fetchProducts(_that);case _FetchProductDetail():
return fetchProductDetail(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchProducts value)?  fetchProducts,TResult? Function( _FetchProductDetail value)?  fetchProductDetail,}){
final _that = this;
switch (_that) {
case _FetchProducts() when fetchProducts != null:
return fetchProducts(_that);case _FetchProductDetail() when fetchProductDetail != null:
return fetchProductDetail(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchProducts,TResult Function( String slug)?  fetchProductDetail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchProducts() when fetchProducts != null:
return fetchProducts();case _FetchProductDetail() when fetchProductDetail != null:
return fetchProductDetail(_that.slug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchProducts,required TResult Function( String slug)  fetchProductDetail,}) {final _that = this;
switch (_that) {
case _FetchProducts():
return fetchProducts();case _FetchProductDetail():
return fetchProductDetail(_that.slug);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchProducts,TResult? Function( String slug)?  fetchProductDetail,}) {final _that = this;
switch (_that) {
case _FetchProducts() when fetchProducts != null:
return fetchProducts();case _FetchProductDetail() when fetchProductDetail != null:
return fetchProductDetail(_that.slug);case _:
  return null;

}
}

}

/// @nodoc


class _FetchProducts implements ProductEvent {
  const _FetchProducts();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchProducts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProductEvent.fetchProducts()';
}


}




/// @nodoc


class _FetchProductDetail implements ProductEvent {
  const _FetchProductDetail(this.slug);
  

 final  String slug;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchProductDetailCopyWith<_FetchProductDetail> get copyWith => __$FetchProductDetailCopyWithImpl<_FetchProductDetail>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchProductDetail&&(identical(other.slug, slug) || other.slug == slug));
}


@override
int get hashCode {
    return Object.hash(runtimeType,slug);
}

@override
String toString() {
    return 'ProductEvent.fetchProductDetail(slug: $slug)';
}


}

/// @nodoc
abstract mixin class _$FetchProductDetailCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$FetchProductDetailCopyWith(_FetchProductDetail value, $Res Function(_FetchProductDetail) _then) = __$FetchProductDetailCopyWithImpl;
@useResult
$Res call({
 String slug
});




}
/// @nodoc
class __$FetchProductDetailCopyWithImpl<$Res>
    implements _$FetchProductDetailCopyWith<$Res> {
  __$FetchProductDetailCopyWithImpl(this._self, this._then);

  final _FetchProductDetail _self;
  final $Res Function(_FetchProductDetail) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? slug = null,}) {
  return _then(_FetchProductDetail(
null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ProductState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProductState()';
}


}

/// @nodoc
class $ProductStateCopyWith<$Res>  {
$ProductStateCopyWith(ProductState _, $Res Function(ProductState) __);
}


/// Adds pattern-matching-related methods to [ProductState].
extension ProductStatePatterns on ProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _ProductDetailLoaded value)?  productDetailLoaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _ProductDetailLoaded() when productDetailLoaded != null:
return productDetailLoaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _ProductDetailLoaded value)  productDetailLoaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _ProductDetailLoaded():
return productDetailLoaded(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _ProductDetailLoaded value)?  productDetailLoaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _ProductDetailLoaded() when productDetailLoaded != null:
return productDetailLoaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<dynamic> products)?  loaded,TResult Function( Map<String, dynamic> detail)?  productDetailLoaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.products);case _ProductDetailLoaded() when productDetailLoaded != null:
return productDetailLoaded(_that.detail);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<dynamic> products)  loaded,required TResult Function( Map<String, dynamic> detail)  productDetailLoaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.products);case _ProductDetailLoaded():
return productDetailLoaded(_that.detail);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<dynamic> products)?  loaded,TResult? Function( Map<String, dynamic> detail)?  productDetailLoaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.products);case _ProductDetailLoaded() when productDetailLoaded != null:
return productDetailLoaded(_that.detail);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProductState {
  const _Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProductState.initial()';
}


}




/// @nodoc


class _Loading implements ProductState {
  const _Loading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProductState.loading()';
}


}




/// @nodoc


class _Loaded implements ProductState {
  const _Loaded( List<dynamic> products): _products = products;
  

 final  List<dynamic> _products;
 List<dynamic> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other.products, _products));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_products));
}

@override
String toString() {
    return 'ProductState.loaded(products: $products)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<dynamic> products
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,}) {
  return _then(_Loaded(
null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}

/// @nodoc


class _ProductDetailLoaded implements ProductState {
  const _ProductDetailLoaded( Map<String, dynamic> detail): _detail = detail;
  

 final  Map<String, dynamic> _detail;
 Map<String, dynamic> get detail {
  if (_detail is EqualUnmodifiableMapView) return _detail;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_detail);
}


/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailLoadedCopyWith<_ProductDetailLoaded> get copyWith => __$ProductDetailLoadedCopyWithImpl<_ProductDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetailLoaded&&const DeepCollectionEquality().equals(other.detail, _detail));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_detail));
}

@override
String toString() {
    return 'ProductState.productDetailLoaded(detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailLoadedCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory _$ProductDetailLoadedCopyWith(_ProductDetailLoaded value, $Res Function(_ProductDetailLoaded) _then) = __$ProductDetailLoadedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> detail
});




}
/// @nodoc
class __$ProductDetailLoadedCopyWithImpl<$Res>
    implements _$ProductDetailLoadedCopyWith<$Res> {
  __$ProductDetailLoadedCopyWithImpl(this._self, this._then);

  final _ProductDetailLoaded _self;
  final $Res Function(_ProductDetailLoaded) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detail = null,}) {
  return _then(_ProductDetailLoaded(
null == detail ? _self._detail : detail // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Error implements ProductState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of ProductState
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
    return 'ProductState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
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

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
