// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OrderEvent()';
}


}

/// @nodoc
class $OrderEventCopyWith<$Res>  {
$OrderEventCopyWith(OrderEvent _, $Res Function(OrderEvent) __);
}


/// Adds pattern-matching-related methods to [OrderEvent].
extension OrderEventPatterns on OrderEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CreateOrder value)?  createOrder,TResult Function( _GetOrders value)?  getOrders,TResult Function( _GetOrderDetail value)?  getOrderDetail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateOrder() when createOrder != null:
return createOrder(_that);case _GetOrders() when getOrders != null:
return getOrders(_that);case _GetOrderDetail() when getOrderDetail != null:
return getOrderDetail(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CreateOrder value)  createOrder,required TResult Function( _GetOrders value)  getOrders,required TResult Function( _GetOrderDetail value)  getOrderDetail,}){
final _that = this;
switch (_that) {
case _CreateOrder():
return createOrder(_that);case _GetOrders():
return getOrders(_that);case _GetOrderDetail():
return getOrderDetail(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CreateOrder value)?  createOrder,TResult? Function( _GetOrders value)?  getOrders,TResult? Function( _GetOrderDetail value)?  getOrderDetail,}){
final _that = this;
switch (_that) {
case _CreateOrder() when createOrder != null:
return createOrder(_that);case _GetOrders() when getOrders != null:
return getOrders(_that);case _GetOrderDetail() when getOrderDetail != null:
return getOrderDetail(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Map<String, dynamic> payload)?  createOrder,TResult Function()?  getOrders,TResult Function( String id)?  getOrderDetail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateOrder() when createOrder != null:
return createOrder(_that.payload);case _GetOrders() when getOrders != null:
return getOrders();case _GetOrderDetail() when getOrderDetail != null:
return getOrderDetail(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Map<String, dynamic> payload)  createOrder,required TResult Function()  getOrders,required TResult Function( String id)  getOrderDetail,}) {final _that = this;
switch (_that) {
case _CreateOrder():
return createOrder(_that.payload);case _GetOrders():
return getOrders();case _GetOrderDetail():
return getOrderDetail(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Map<String, dynamic> payload)?  createOrder,TResult? Function()?  getOrders,TResult? Function( String id)?  getOrderDetail,}) {final _that = this;
switch (_that) {
case _CreateOrder() when createOrder != null:
return createOrder(_that.payload);case _GetOrders() when getOrders != null:
return getOrders();case _GetOrderDetail() when getOrderDetail != null:
return getOrderDetail(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _CreateOrder implements OrderEvent {
  const _CreateOrder( Map<String, dynamic> payload): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of OrderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateOrderCopyWith<_CreateOrder> get copyWith => __$CreateOrderCopyWithImpl<_CreateOrder>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateOrder&&const DeepCollectionEquality().equals(other.payload, _payload));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));
}

@override
String toString() {
    return 'OrderEvent.createOrder(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$CreateOrderCopyWith<$Res> implements $OrderEventCopyWith<$Res> {
  factory _$CreateOrderCopyWith(_CreateOrder value, $Res Function(_CreateOrder) _then) = __$CreateOrderCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$CreateOrderCopyWithImpl<$Res>
    implements _$CreateOrderCopyWith<$Res> {
  __$CreateOrderCopyWithImpl(this._self, this._then);

  final _CreateOrder _self;
  final $Res Function(_CreateOrder) _then;

/// Create a copy of OrderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_CreateOrder(
null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _GetOrders implements OrderEvent {
  const _GetOrders();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetOrders);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OrderEvent.getOrders()';
}


}




/// @nodoc


class _GetOrderDetail implements OrderEvent {
  const _GetOrderDetail(this.id);
  

 final  String id;

/// Create a copy of OrderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetOrderDetailCopyWith<_GetOrderDetail> get copyWith => __$GetOrderDetailCopyWithImpl<_GetOrderDetail>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetOrderDetail&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id);
}

@override
String toString() {
    return 'OrderEvent.getOrderDetail(id: $id)';
}


}

/// @nodoc
abstract mixin class _$GetOrderDetailCopyWith<$Res> implements $OrderEventCopyWith<$Res> {
  factory _$GetOrderDetailCopyWith(_GetOrderDetail value, $Res Function(_GetOrderDetail) _then) = __$GetOrderDetailCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$GetOrderDetailCopyWithImpl<$Res>
    implements _$GetOrderDetailCopyWith<$Res> {
  __$GetOrderDetailCopyWithImpl(this._self, this._then);

  final _GetOrderDetail _self;
  final $Res Function(_GetOrderDetail) _then;

/// Create a copy of OrderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_GetOrderDetail(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$OrderState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OrderState()';
}


}

/// @nodoc
class $OrderStateCopyWith<$Res>  {
$OrderStateCopyWith(OrderState _, $Res Function(OrderState) __);
}


/// Adds pattern-matching-related methods to [OrderState].
extension OrderStatePatterns on OrderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _OrderCreated value)?  orderCreated,TResult Function( _OrdersLoaded value)?  ordersLoaded,TResult Function( _OrderDetailLoaded value)?  orderDetailLoaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _OrderCreated() when orderCreated != null:
return orderCreated(_that);case _OrdersLoaded() when ordersLoaded != null:
return ordersLoaded(_that);case _OrderDetailLoaded() when orderDetailLoaded != null:
return orderDetailLoaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _OrderCreated value)  orderCreated,required TResult Function( _OrdersLoaded value)  ordersLoaded,required TResult Function( _OrderDetailLoaded value)  orderDetailLoaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _OrderCreated():
return orderCreated(_that);case _OrdersLoaded():
return ordersLoaded(_that);case _OrderDetailLoaded():
return orderDetailLoaded(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _OrderCreated value)?  orderCreated,TResult? Function( _OrdersLoaded value)?  ordersLoaded,TResult? Function( _OrderDetailLoaded value)?  orderDetailLoaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _OrderCreated() when orderCreated != null:
return orderCreated(_that);case _OrdersLoaded() when ordersLoaded != null:
return ordersLoaded(_that);case _OrderDetailLoaded() when orderDetailLoaded != null:
return orderDetailLoaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Map<String, dynamic> data)?  orderCreated,TResult Function( List<dynamic> orders)?  ordersLoaded,TResult Function( Map<String, dynamic> detail)?  orderDetailLoaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _OrderCreated() when orderCreated != null:
return orderCreated(_that.data);case _OrdersLoaded() when ordersLoaded != null:
return ordersLoaded(_that.orders);case _OrderDetailLoaded() when orderDetailLoaded != null:
return orderDetailLoaded(_that.detail);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Map<String, dynamic> data)  orderCreated,required TResult Function( List<dynamic> orders)  ordersLoaded,required TResult Function( Map<String, dynamic> detail)  orderDetailLoaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _OrderCreated():
return orderCreated(_that.data);case _OrdersLoaded():
return ordersLoaded(_that.orders);case _OrderDetailLoaded():
return orderDetailLoaded(_that.detail);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Map<String, dynamic> data)?  orderCreated,TResult? Function( List<dynamic> orders)?  ordersLoaded,TResult? Function( Map<String, dynamic> detail)?  orderDetailLoaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _OrderCreated() when orderCreated != null:
return orderCreated(_that.data);case _OrdersLoaded() when ordersLoaded != null:
return ordersLoaded(_that.orders);case _OrderDetailLoaded() when orderDetailLoaded != null:
return orderDetailLoaded(_that.detail);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements OrderState {
  const _Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OrderState.initial()';
}


}




/// @nodoc


class _Loading implements OrderState {
  const _Loading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OrderState.loading()';
}


}




/// @nodoc


class _OrderCreated implements OrderState {
  const _OrderCreated( Map<String, dynamic> data): _data = data;
  

 final  Map<String, dynamic> _data;
 Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}


/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCreatedCopyWith<_OrderCreated> get copyWith => __$OrderCreatedCopyWithImpl<_OrderCreated>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderCreated&&const DeepCollectionEquality().equals(other.data, _data));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));
}

@override
String toString() {
    return 'OrderState.orderCreated(data: $data)';
}


}

/// @nodoc
abstract mixin class _$OrderCreatedCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory _$OrderCreatedCopyWith(_OrderCreated value, $Res Function(_OrderCreated) _then) = __$OrderCreatedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> data
});




}
/// @nodoc
class __$OrderCreatedCopyWithImpl<$Res>
    implements _$OrderCreatedCopyWith<$Res> {
  __$OrderCreatedCopyWithImpl(this._self, this._then);

  final _OrderCreated _self;
  final $Res Function(_OrderCreated) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_OrderCreated(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _OrdersLoaded implements OrderState {
  const _OrdersLoaded( List<dynamic> orders): _orders = orders;
  

 final  List<dynamic> _orders;
 List<dynamic> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}


/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrdersLoadedCopyWith<_OrdersLoaded> get copyWith => __$OrdersLoadedCopyWithImpl<_OrdersLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrdersLoaded&&const DeepCollectionEquality().equals(other.orders, _orders));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_orders));
}

@override
String toString() {
    return 'OrderState.ordersLoaded(orders: $orders)';
}


}

/// @nodoc
abstract mixin class _$OrdersLoadedCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory _$OrdersLoadedCopyWith(_OrdersLoaded value, $Res Function(_OrdersLoaded) _then) = __$OrdersLoadedCopyWithImpl;
@useResult
$Res call({
 List<dynamic> orders
});




}
/// @nodoc
class __$OrdersLoadedCopyWithImpl<$Res>
    implements _$OrdersLoadedCopyWith<$Res> {
  __$OrdersLoadedCopyWithImpl(this._self, this._then);

  final _OrdersLoaded _self;
  final $Res Function(_OrdersLoaded) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orders = null,}) {
  return _then(_OrdersLoaded(
null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}

/// @nodoc


class _OrderDetailLoaded implements OrderState {
  const _OrderDetailLoaded( Map<String, dynamic> detail): _detail = detail;
  

 final  Map<String, dynamic> _detail;
 Map<String, dynamic> get detail {
  if (_detail is EqualUnmodifiableMapView) return _detail;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_detail);
}


/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDetailLoadedCopyWith<_OrderDetailLoaded> get copyWith => __$OrderDetailLoadedCopyWithImpl<_OrderDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDetailLoaded&&const DeepCollectionEquality().equals(other.detail, _detail));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_detail));
}

@override
String toString() {
    return 'OrderState.orderDetailLoaded(detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$OrderDetailLoadedCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory _$OrderDetailLoadedCopyWith(_OrderDetailLoaded value, $Res Function(_OrderDetailLoaded) _then) = __$OrderDetailLoadedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> detail
});




}
/// @nodoc
class __$OrderDetailLoadedCopyWithImpl<$Res>
    implements _$OrderDetailLoadedCopyWith<$Res> {
  __$OrderDetailLoadedCopyWithImpl(this._self, this._then);

  final _OrderDetailLoaded _self;
  final $Res Function(_OrderDetailLoaded) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detail = null,}) {
  return _then(_OrderDetailLoaded(
null == detail ? _self._detail : detail // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Error implements OrderState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of OrderState
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
    return 'OrderState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
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

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
