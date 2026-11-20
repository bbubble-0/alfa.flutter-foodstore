import 'package:flutter/material.dart';
import 'package:flutter_application/bloc/cart/cart_bloc.dart';
import 'package:flutter_application/core/utils/currency_helper.dart';
import 'package:flutter_application/page/cart/widgets/cart_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(const CartEvent.fetchCart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            stored: (_) => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text(message)),
            loaded: (cartResponse) {
              final carts = cartResponse.carts ?? [];
              final totalPrice = cartResponse.totalPrice ?? 0;
              final totalWeight = cartResponse.totalWeight ?? 0;

              if (carts.isEmpty) {
                return Column(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text('Data kosong'),
                      ),
                    ),
                    _buildBottomCheckout(
                      context,
                      totalPrice: 0,
                      totalWeight: 0,
                      isEnabled: false,
                    ),
                  ],
                );
              }

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: carts.length,
                      itemBuilder: (context, index) {
                        return CartCard(cart: carts[index]);
                      },
                    ),
                  ),
                  _buildBottomCheckout(
                    context,
                    totalPrice: totalPrice,
                    totalWeight: totalWeight,
                    isEnabled: true,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildBottomCheckout(
    BuildContext context, {
    required int totalPrice,
    required int totalWeight,
    required bool isEnabled,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                CurrencyHelper.formatRupiah(totalPrice),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildCheckoutButton(
            context,
            totalPrice: totalPrice,
            totalWeight: totalWeight,
            isEnabled: isEnabled,
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutButton(
    BuildContext context, {
    required int totalPrice,
    required int totalWeight,
    required bool isEnabled,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isEnabled
            ? () => context.push(
                  '/checkout',
                  extra: {
                    'totalPrice': totalPrice,
                    'totalWeight': totalWeight,
                  },
                )
            : null,
        child: const Text('Proceed to Checkout'),
      ),
    );
  }
}