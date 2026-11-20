abstract class ProductEvent {}

class FetchProducts extends ProductEvent {}

class FetchProductDetail extends ProductEvent {
  final int id;

  FetchProductDetail(this.id);
}