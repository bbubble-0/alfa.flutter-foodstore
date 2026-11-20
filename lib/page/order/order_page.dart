import 'package:flutter/material.dart';
import 'package:flutter_application/bloc/order/order_cubit.dart';
import 'package:flutter_application/bloc/order/order_state.dart';
import 'package:flutter_application/page/order/widgets/order_card.dart';
import 'package:flutter_application/resource/model/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    super.initState();
    context.read<OrderCubit>().fetchOrders(isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading && state.isFirstFetch) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is OrderError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Something went wrong'),
                  const SizedBox(height: 8),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      context.read<OrderCubit>().fetchOrders(isRefresh: true);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          List<OrderModel> orders = [];
          bool hasMore = false;
          bool isLoadingMore = false;

          if (state is OrderLoaded) {
            orders = state.orders;
            hasMore = state.hasMore;
          } else if (state is OrderLoading) {
            orders = state.currentOrders;
            hasMore = true;
            isLoadingMore = true;
          }

          if (orders.isEmpty) {
            return const Center(
              child: Text('No Data Order'),
            );
          }

          return RefreshIndicator(
            onRefresh: () => context.read<OrderCubit>().fetchOrders(isRefresh: true),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: orders.length + (hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == orders.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Center(
                      child: isLoadingMore
                          ? const CircularProgressIndicator()
                          : TextButton(
                              onPressed: () {
                                context.read<OrderCubit>().fetchOrders();
                              },
                              child: const Text('Load More'),
                            ),
                    ),
                  );
                }

                final order = orders[index];
                return OrderCard(
                  order: order,
                  onTap: () {},
                );
              },
            ),
          );
        },
      ),
    );
  }
}