
import 'package:flutter/material.dart';
import 'package:flutter_application/bloc/cart/cart_bloc.dart';
import 'package:flutter_application/core/constants/app_config.dart';
import 'package:flutter_application/core/utils/currency_helper.dart';
import 'package:flutter_application/resource/model/cart_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCard extends StatelessWidget {
  final Cart cart;

  const CartCard({
    super.key,
    required this.cart,
  });

  String _resolveImageUrl(String? image) {
    if (image == null || image.isEmpty) return '';

    if (image.startsWith('http://') || image.startsWith('https://')) {
      return image;
    }

    return '${AppConfig.BASE_URL}/storage/$image';
  }

  @override
  Widget build(BuildContext context) {
    final product = cart.product;
    final imageUrl = _resolveImageUrl(product?.image);
    final qty = cart.qty ?? 1;
    final productId = cart.productId ?? product?.id ?? 0;
    final cartId = cart.id ?? 0;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 68,
                height: 68,
                child: imageUrl.isEmpty
                    ? Container(
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.fastfood),
                      )
                    : Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.grey.shade200,
                          child: const Icon(Icons.broken_image),
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product?.name ?? '-',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    CurrencyHelper.formatRupiah(product?.price),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          if (qty > 1) {
                            context.read<CartBloc>().add(
                              CartEvent.decrement(
                                productId: productId,
                                cartId: cartId,
                              ),
                            );
                          } else {
                            context.read<CartBloc>().add(
                              CartEvent.removeCart(cartId),
                            );
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          qty.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () {
                          context.read<CartBloc>().add(
                            CartEvent.increment(
                              productId: productId,
                              cartId: cartId,
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          context.read<CartBloc>().add(
                            CartEvent.removeCart(cartId),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
