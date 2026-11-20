import 'package:flutter_application/resource/model/order_model.dart';

abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {
  final List<OrderModel> currentOrders;
  final bool isFirstFetch;

  OrderLoading({
    this.currentOrders = const [],
    this.isFirstFetch = false,
  });
}

class OrderLoaded extends OrderState {
  final List<OrderModel> orders;
  final bool hasMore;
  final int currentPage;

  OrderLoaded({
    required this.orders,
    this.hasMore = false,
    this.currentPage = 1,
  });
}

class OrderError extends OrderState {
  final String message;

  OrderError(this.message);
}