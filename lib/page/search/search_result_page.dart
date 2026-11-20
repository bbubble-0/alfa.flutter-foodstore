import 'package:flutter/material.dart';
import 'package:flutter_application/core/utils/currency_helper.dart';

class SearchResultPage extends StatefulWidget {
  final String initialQuery;

  const SearchResultPage({
    super.key,
    this.initialQuery = '',
  });

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  late final TextEditingController _searchController;

  final List<Map<String, dynamic>> _products = const [
    {
      'title': 'Rice with Vegetables',
      'price': 30000,
      'rating': 5.0,
    },
    {
      'title': 'Rice with Meat',
      'price': 30000,
      'rating': 0.0,
    },
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyword = _searchController.text.trim().toLowerCase();
    final results = keyword.isEmpty
        ? _products
        : _products.where((item) {
            final title = (item['title'] as String).toLowerCase();
            return title.contains(keyword);
          }).toList();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
          onChanged: (_) => setState(() {}),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: results.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = results[index];
          final title = item['title'] as String;
          final price = item['price'] as int;
          final rating = item['rating'] as double;

          return Card(
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(CurrencyHelper.formatRupiah(price)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                  const SizedBox(width: 4),
                  Text(rating.toStringAsFixed(1)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}