import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_config.dart';
import 'package:flutter_application/core/utils/currency_helper.dart';
import 'package:flutter_application/resource/model/product_model.dart';
import 'package:flutter_application/resource/remote/home_remote_resource.dart';
import 'package:go_router/go_router.dart';

class AllProductsPage extends StatefulWidget {
  final String title;
  final HomeRemoteResource homeRemoteResource;

  const AllProductsPage({
    super.key,
    this.title = 'All Product',
    required this.homeRemoteResource,
  });

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  final List<ProductModel> _products = [];
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchProduct(isRefresh: true);
  }

  Future<void> _fetchProduct({bool isRefresh = false}) async {
    if (_isLoading) return;
    if (isRefresh) {
      _currentPage = 1;
      _hasMore = true;
      _products.clear();
      _errorMessage = null;
    }
    if (!_hasMore && !isRefresh) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final result = await widget.homeRemoteResource.fetchProducts(
      page: _currentPage,
    );

    if (!mounted) return;

    result.fold(
      (error) {
        setState(() {
          _isLoading = false;
          _errorMessage = error;
        });
      },
      (paging) {
        final items = paging.data ?? [];
        setState(() {
          _products.addAll(items);
          _hasMore = paging.nextPageUrl != null ||
              ((paging.currentPage ?? _currentPage) <
                  (paging.lastPage ?? _currentPage));
          if (_hasMore) {
            _currentPage++;
          }
          _isLoading = false;
        });
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
        title: Text(widget.title),
      ),
      body: _isLoading && _products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null && _products.isEmpty
              ? Center(child: Text(_errorMessage!))
              : _products.isEmpty
                  ? const Center(child: Text('No products found'))
                  : ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
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
                                        borderRadius:
                                            const BorderRadius.vertical(
                                          top: Radius.circular(12),
                                        ),
                                        child: imageUrl.isEmpty
                                            ? Container(
                                                color: Colors.grey.shade200,
                                                width: double.infinity,
                                                child:
                                                    const Icon(Icons.fastfood),
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
                        if (_hasMore) ...[
                          const SizedBox(height: 16),
                          Center(
                            child: _isLoading
                                ? const CircularProgressIndicator()
                                : ElevatedButton(
                                    onPressed: () => _fetchProduct(),
                                    child: const Text('Load More'),
                                  ),
                          ),
                        ],
                      ],
                    ),
    );
  }
}