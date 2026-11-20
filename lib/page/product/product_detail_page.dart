import 'package:flutter/material.dart';
import 'package:flutter_application/model/product_model.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name ?? 'Detail Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              product.name ?? 'Nama Produk',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Harga: Rp ${product.price ?? 0}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Text(product.description ?? 'Deskripsi produk belum tersedia.'),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Tambah ke Keranjang'),
            ),
          ],
        ),
      ),
    );
  }
}