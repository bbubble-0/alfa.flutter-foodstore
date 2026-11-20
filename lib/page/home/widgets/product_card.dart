import 'package:flutter/material.dart';
import 'package:flutter_application/bloc/cart/cart_bloc.dart';
import 'package:flutter_application/core/constants/app_config.dart';
import 'package:flutter_application/core/utils/currency_helper.dart';
import 'package:flutter_application/resource/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  /// Menghasilkan URL gambar yang valid.
  /// - Kalau sudah http/https, dipakai apa adanya.
  /// - Kalau hanya nama file, digabung dengan BASE_URL (tanpa double slash).
  String _resolveImageUrl(String? image) {
    if (image == null || image.trim().isEmpty) return '';

    final img = image.trim();

    if (img.startsWith('http://') || img.startsWith('https://')) {
      return Uri.encodeFull(img);
    }

    final base = AppConfig.BASE_URL.endsWith('/')
        ? AppConfig.BASE_URL.substring(0, AppConfig.BASE_URL.length - 1)
        : AppConfig.BASE_URL;

    final file = img.startsWith('/') ? img.substring(1) : img;

    return Uri.encodeFull('$base/storage/$file');
  }

  Widget _placeholder(IconData icon) {
    return Container(
      color: Colors.grey.shade200,
      width: double.infinity,
      height: double.infinity,
      child: Center(child: Icon(icon)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = _resolveImageUrl(product.image);
    debugPrint('PRODUCT raw=${product.image} -> url=$imageUrl');

    final ratingText = (product.rating ?? 0.0).toStringAsFixed(1);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: SizedBox(
                height: 110,
                width: double.infinity,
                child: imageUrl.isEmpty
                    ? _placeholder(Icons.fastfood)
                    : Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          );
                        },
                        errorBuilder: (_, error, stackTrace) {
                          debugPrint(
                            'PRODUCT IMAGE ERROR url=$imageUrl error=$error',
                          );
                          return _placeholder(Icons.broken_image);
                        },
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        CurrencyHelper.formatRupiah(product.price),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          final productId = product.id;

                          if (productId != null) {
                            context.read<CartBloc>().add(
                                  CartEvent.addCart(
                                    productId: productId,
                                    qty: 1,
                                  ),
                                );

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Produk ditambahkan ke keranjang',
                                ),
                              ),
                            );
                          }
                        },
                        child: const Icon(
                          Icons.add_shopping_cart,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 14,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        ratingText,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade700,
                        ),
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