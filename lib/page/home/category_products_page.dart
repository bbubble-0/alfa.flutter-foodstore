import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_config.dart';
import 'package:flutter_application/core/utils/currency_helper.dart';
import 'package:flutter_application/resource/model/category_model.dart';
import 'package:flutter_application/resource/model/product_model.dart';
import 'package:flutter_application/resource/remote/home_remote_resource.dart';
import 'package:go_router/go_router.dart';

class CategoryProductsPage extends StatefulWidget {
  final CategoryModel? category;
  final String? slug;
  final String? categoryName;
  final HomeRemoteResource homeRemoteResource;

  const CategoryProductsPage({
    super.key,
    this.category,
    this.slug,
    this.categoryName,
    required this.homeRemoteResource,
  });

  @override
  State<CategoryProductsPage> createState() => _CategoryProductsPageState();
}

class _CategoryProductsPageState extends State<CategoryProductsPage> {
  bool _isLoading = true;
  String? _errorMessage;
  List<ProductModel> _products = [];

  String get _resolvedCategoryName {
    return widget.category?.name ??
        widget.categoryName ??
        widget.slug ??
        'Category';
  }

  String get _resolvedSlug {
    return widget.category?.slug ?? widget.slug ?? '';
  }

  @override
  void initState() {
    super.initState();
    _fetchProductsByCategory();
  }

  Future<void> _fetchProductsByCategory() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final slug = _resolvedSlug;
    if (slug.isEmpty) {
      setState(() {
        _isLoading = false;
        _products = [];
      });
      return;
    }

    final categoryResult = await widget.homeRemoteResource.fetchCategoryBySlug(slug);
    final productsResult = await widget.homeRemoteResource.fetchProducts(
      page: 1,
      query: slug,
    );

    if (!mounted) return;

    categoryResult.fold(
      (error) {
        productsResult.fold(
          (prodError) => setState(() {
            _isLoading = false;
            _errorMessage = error.isNotEmpty ? error : prodError;
          }),
          (paging) => setState(() {
            _isLoading = false;
            _products = paging.data ?? [];
          }),
        );
      },
      (_) {
        productsResult.fold(
          (prodError) => setState(() {
            _isLoading = false;
            _errorMessage = prodError;
          }),
          (paging) => setState(() {
            _isLoading = false;
            _products = paging.data ?? [];
          }),
        );
      },
    );
  }

  String _resolveImageUrl(String? image) {
  if (image == null || image.isEmpty) return '';

  if (image.startsWith('http://') || image.startsWith('https://')) {
    return image;
  }

  return '${AppConfig.BASE_URL}/storage/$image';
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product In $_resolvedCategoryName'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : _products.isEmpty
                  ? const Center(
                      child: Text('Product not found'),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        final product = _products[index];
                        final imageUrl = _resolveImageUrl(product.image);
                        debugPrint('CATEGORY IMAGE: $imageUrl');
                        final ratingText =
                            (product.rating ?? 0.0).toStringAsFixed(1);

                        return InkWell(
                          onTap: () {
                            context.push('/product-detail', extra: product);
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                    child: imageUrl.isEmpty
                                        ? Container(
                                            color: Colors.grey.shade200,
                                            width: double.infinity,
                                            child: const Icon(Icons.fastfood),
                                          )
                                        : Image.network(
                                            imageUrl,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            errorBuilder: (_, __, ___) =>
                                                Container(
                                              color: Colors.grey.shade200,
                                              child: const Icon(
                                                Icons.broken_image,
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        CurrencyHelper.formatRupiah(
                                          product.price,
                                        ),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
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
                      },
                    ),
    );
  }
}