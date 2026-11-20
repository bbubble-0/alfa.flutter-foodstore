abstract class OrderEvent {}

class CreateOrderSubmitted extends OrderEvent {
  final Map<String, dynamic> payload;

  CreateOrderSubmitted(this.payload);
}

class FetchOrders extends OrderEvent {}

class FetchOrderDetail extends OrderEvent {
  final int id;

  FetchOrderDetail(this.id);
}