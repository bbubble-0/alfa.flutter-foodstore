import 'package:flutter/material.dart';
import 'package:flutter_application/bloc/cart/cart_bloc.dart';
import 'package:flutter_application/core/constants/app_config.dart';
import 'package:flutter_application/core/utils/currency_helper.dart';
import 'package:flutter_application/resource/model/product_model.dart';
import 'package:flutter_application/resource/remote/home_remote_resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel? product;
  final String? slug;
  final HomeRemoteResource? homeRemoteResource;

  const ProductDetailPage({
    super.key,
    this.product,
    this.slug,
    this.homeRemoteResource,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  ProductModel? _product;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _product = widget.product;

    final targetSlug = widget.slug ?? widget.product?.slug;

    if (targetSlug != null &&
        targetSlug.isNotEmpty &&
        widget.homeRemoteResource != null) {
      _loadDetail(targetSlug);
    }
  }

  Future<void> _loadDetail(String slug) async {
    setState(() => _isLoading = true);

    try {
      final result =
          await widget.homeRemoteResource!.detailProduct(slug);

      if (!mounted) return;

      result.fold(
        (_) {
          setState(() => _isLoading = false);
        },
        (detail) {
          setState(() {
            _product = detail;
            _isLoading = false;
          });
        },
      );
    } catch (e) {
      if (!mounted) return;

      setState(() => _isLoading = false);
    }
  }

  String _resolveImageUrl(String? image) {
    if (image == null || image.isEmpty) return '';

    if (image.startsWith('http://') ||
        image.startsWith('https://')) {
      return image;
    }

    return '${AppConfig.BASE_URL}/storage/$image';
  }

  void _onAddToCart(BuildContext context) {
    final productId = _product?.id;

    if (productId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Produk tidak dapat ditambahkan'),
        ),
      );
      return;
    }

    context.read<CartBloc>().add(
      CartEvent.addCart(
        productId: productId,
        qty: 1,
      ),
    );
  }

  Widget _buildProductImage(String imageUrl) {
    return Container(
      width: double.infinity,
      height: 300,
      color: const Color(0xFFF3F3F3),
      child: imageUrl.isEmpty
          ? const Center(
              child: Icon(
                Icons.coffee_rounded,
                size: 90,
                color: Colors.brown,
              ),
            )
          : Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) {
                return const Center(
                  child: Icon(
                    Icons.broken_image_outlined,
                    size: 70,
                    color: Colors.grey,
                  ),
                );
              },
            ),
    );
  }

  Widget _buildRating(double rating, int reviewCount) {
    return Row(
      children: [
        const Icon(
          Icons.star_rounded,
          color: Colors.amber,
          size: 22,
        ),
        const SizedBox(width: 5),
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          '($reviewCount reviews)',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = _product;
    final imageUrl = _resolveImageUrl(product?.image);
    final rating = product?.rating ?? 0.0;
    final reviewCount = product?.reviewCount ?? 0;

    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        state.whenOrNull(
          stored: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  message.isNotEmpty
                      ? message
                      : 'Produk berhasil ditambahkan ke keranjang',
                ),
                backgroundColor: Colors.green.shade700,
              ),
            );
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Detail Produk',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: _isLoading && product == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.brown,
                ),
              )
            : product == null
                ? const Center(
                    child: Text('Produk tidak ditemukan'),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // PRODUCT IMAGE
                        _buildProductImage(imageUrl),

                        // PRODUCT INFORMATION
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              // PRODUCT NAME
                              Text(
                                product.name ?? 'Nama Produk',
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF222222),
                                ),
                              ),

                              const SizedBox(height: 12),

                              // PRICE
                              Text(
                                CurrencyHelper.formatRupiah(
                                  product.price,
                                ),
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF8B4513),
                                ),
                              ),

                              const SizedBox(height: 12),

                              // RATING
                              _buildRating(
                                rating,
                                reviewCount,
                              ),

                              const SizedBox(height: 20),

                              const Divider(),

                              // DESCRIPTION
                              const Text(
                                'Deskripsi Produk',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Text(
                                product.description == null ||
                                        product.description!.isEmpty
                                    ? 'Belum ada deskripsi produk.'
                                    : product.description!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                  height: 1.7,
                                ),
                              ),

                              const SizedBox(height: 20),

                              const Divider(),

                              // REVIEW SECTION
                              const Text(
                                'Rating & Review',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 12),

                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8F8F8),
                                  borderRadius:
                                      BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.rate_review_outlined,
                                      color: Colors.grey.shade500,
                                      size: 30,
                                    ),
                                    const SizedBox(width: 12),
                                    const Expanded(
                                      child: Text(
                                        'Review pelanggan akan ditampilkan di sini.',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 25),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

        // BUTTON ADD TO CART
        bottomNavigationBar: product == null
            ? null
            : Container(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  12,
                  20,
                  20,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: SizedBox(
                    height: 52,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _onAddToCart(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6F4E37),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart_outlined),
                          SizedBox(width: 10),
                          Text(
                            'Tambah ke Keranjang',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}