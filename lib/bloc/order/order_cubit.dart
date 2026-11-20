import 'package:flutter_application/bloc/order/order_state.dart';
import 'package:flutter_application/resource/model/order_model.dart';
import 'package:flutter_application/resource/remote/order_remote_resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRemoteResource orderRemoteResource;

  OrderCubit(this.orderRemoteResource) : super(OrderInitial());

  int _page = 1;
  bool _hasMore = true;
  bool _isFetching = false;
  List<OrderModel> _orders = [];

  Future<void> fetchOrders({bool isRefresh = false}) async {
    if (_isFetching) return;
    if (isRefresh) {
      _page = 1;
      _hasMore = true;
      _orders = [];
    }
    if (!_hasMore && !isRefresh) return;

    _isFetching = true;
    if (_page == 1) {
      emit(OrderLoading(currentOrders: _orders, isFirstFetch: true));
    } else {
      emit(OrderLoading(currentOrders: _orders, isFirstFetch: false));
    }

    final result = await orderRemoteResource.fetchOrders(page: _page);
    result.fold(
      (error) {
        _isFetching = false;
        emit(OrderError(error));
      },
      (paging) {
        final newItems = paging.data ?? [];
        _orders = isRefresh ? newItems : [..._orders, ...newItems];
        _hasMore =
            paging.nextPageUrl != null ||
            ((paging.currentPage ?? _page) < (paging.lastPage ?? _page));
        if (_hasMore) {
          _page++;
        }
        _isFetching = false;
        emit(
          OrderLoaded(
            orders: _orders,
            hasMore: _hasMore,
            currentPage: paging.currentPage ?? _page,
          ),
        );
      },
    );
  }
}