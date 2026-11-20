import 'package:flutter/material.dart';
import 'package:flutter_application/bloc/category/category_cubit.dart';
import 'package:flutter_application/bloc/product/product_cubit.dart';
import 'package:flutter_application/bloc/product/product_state.dart';
import 'package:flutter_application/bloc/slider/slider_cubit.dart';
import 'package:flutter_application/page/home/widgets/category_widget.dart';
import 'package:flutter_application/page/home/widgets/product_card.dart';
import 'package:flutter_application/page/home/widgets/slider_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController =
      TextEditingController();

  static const Color primaryColor = Color(0xFF6F4E37);
  static const Color backgroundColor = Color(0xFFF8F6F3);

  @override
  void initState() {
    super.initState();

    context.read<SliderCubit>().fetchSliders();
    context.read<CategoryCubit>().fetchCategories();
    context.read<ProductCubit>().fetchHomeProducts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchProduct(String query) {
    final keyword = query.trim();

    context.push('/search', extra: keyword);
  }

  void _navigateBottom(int index) {
    switch (index) {
      case 0:
        context.go('/dashboard/home');
        break;
      case 1:
        context.go('/products', extra: 'All Product');
        break;
      case 2:
        context.go('/dashboard/order');
        break;
      case 3:
        context.go('/dashboard/profile');
        break;
    }
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Coffee Shop ☕',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3E2723),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              onPressed: () {
                context.push('/dashboard/cart');
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              textInputAction: TextInputAction.search,
              onSubmitted: _searchProduct,
              decoration: InputDecoration(
                hintText: 'Search your favorite coffee...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 13,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: primaryColor,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.grey.shade200,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              onPressed: () {
                _searchProduct(_searchController.text);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader({
    required String title,
    VoidCallback? onSeeMore,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3E2723),
            ),
          ),
          TextButton(
            onPressed: onSeeMore,
            child: const Text(
              'Lihat Lainnya',
              style: TextStyle(
                color: primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList(
    List<dynamic> products,
  ) {
    return SizedBox(
      height: 195,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final item = products[index];

          return ProductCard(
            product: item,
            onTap: () {
              context.push(
                '/product-detail',
                extra: item,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildProducts() {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Padding(
            padding: EdgeInsets.all(30),
            child: Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            ),
          );
        }

        if (state is ProductError) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 40,
                    color: Colors.redAccent,
                  ),
                  const SizedBox(height: 8),
                  Text(state.message),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProductCubit>().fetchHomeProducts();
                    },
                    child: const Text('Coba Lagi'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is ProductLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionHeader(
                title: 'Product Popular',
                onSeeMore: () {
                  context.push('/products', extra: 'All Product');
                },
              ),
              const SizedBox(height: 10),
              _buildProductList(state.popularProducts),
              const SizedBox(height: 24),
              _sectionHeader(
                title: 'Product Terbaru',
                onSeeMore: () {
                  context.push('/products', extra: 'All Product');
                },
              ),
              const SizedBox(height: 10),
              _buildProductList(state.latestProducts),
              const SizedBox(height: 20),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: _navigateBottom,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey.shade500,
      selectedFontSize: 11,
      unselectedFontSize: 11,
      elevation: 10,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.coffee_outlined),
          activeIcon: Icon(Icons.coffee),
          label: 'Products',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long_outlined),
          activeIcon: Icon(Icons.receipt_long),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          color: primaryColor,
          onRefresh: () async {
            context.read<SliderCubit>().fetchSliders();
            context.read<CategoryCubit>().fetchCategories();
            await context.read<ProductCubit>().fetchHomeProducts();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                _buildHeader(),

                const SizedBox(height: 20),

                // SEARCH
                _buildSearch(),

                const SizedBox(height: 22),

                // SLIDER
                const SliderWidget(),

                const SizedBox(height: 24),

                // CATEGORY TITLE
                _sectionHeader(
                  title: 'Categories',
                  onSeeMore: () {
                    context.push('/products', extra: 'All Product');
                  },
                ),

                const SizedBox(height: 12),

                // CATEGORY LIST
                CategoryWidget(
                  onCategoryTap: (category) {
                    context.push(
                      '/category-products',
                      extra: category,
                    );
                  },
                ),

                const SizedBox(height: 24),

                // PRODUCT LISTS
                _buildProducts(),
              ],
            ),
          ),
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }
}