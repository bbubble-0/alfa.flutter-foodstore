import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_bloc.freezed.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.createOrder(Map<String, dynamic> payload) =
      _CreateOrder;
  const factory OrderEvent.getOrders() = _GetOrders;
  const factory OrderEvent.getOrderDetail(String id) = _GetOrderDetail;
}

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = _Initial;
  const factory OrderState.loading() = _Loading;
  const factory OrderState.orderCreated(Map<String, dynamic> data) =
      _OrderCreated;
  const factory OrderState.ordersLoaded(List<dynamic> orders) = _OrdersLoaded;
  const factory OrderState.orderDetailLoaded(Map<String, dynamic> detail) =
      _OrderDetailLoaded;
  const factory OrderState.error(String message) = _Error;
}

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(const OrderState.initial()) {
    on<_CreateOrder>((event, emit) async {
      emit(const OrderState.loading());
      try {
        emit(OrderState.orderCreated(event.payload));
      } catch (e) {
        emit(OrderState.error(e.toString()));
      }
    });

    on<_GetOrders>((event, emit) async {
      emit(const OrderState.loading());
      try {
        emit(const OrderState.ordersLoaded([]));
      } catch (e) {
        emit(OrderState.error(e.toString()));
      }
    });

    on<_GetOrderDetail>((event, emit) async {
      emit(const OrderState.loading());
      try {
        emit(OrderState.orderDetailLoaded({'id': event.id}));
      } catch (e) {
        emit(OrderState.error(e.toString()));
      }
    });
  }
}