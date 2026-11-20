
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/bloc/auth/auth_bloc.dart';
import 'package:flutter_application/bloc/cart/cart_bloc.dart';
import 'package:flutter_application/bloc/checkout/checkout_cubit.dart';
import 'package:flutter_application/bloc/location/location_cubit.dart';
import 'package:flutter_application/bloc/order/order_cubit.dart';
import 'package:flutter_application/bloc/profile/profile_bloc.dart';
import 'package:flutter_application/bloc/shipping_cost/shipping_cost_cubit.dart';
import 'package:flutter_application/core/constants/app_config.dart';
import 'package:flutter_application/page/auth/login_page.dart';
import 'package:flutter_application/page/auth/register_page.dart';
import 'package:flutter_application/page/cart/cart_page.dart';
import 'package:flutter_application/page/checkout/checkout_page.dart';
import 'package:flutter_application/page/home/all_products_page.dart';
import 'package:flutter_application/page/home/category_products_page.dart';
import 'package:flutter_application/page/home/home_page.dart';
import 'package:flutter_application/page/home/product_detail_page.dart';
import 'package:flutter_application/page/order/order_detail_page.dart';
import 'package:flutter_application/page/order/order_page.dart';
import 'package:flutter_application/page/order/payment_page.dart';
import 'package:flutter_application/page/profile/profile_page.dart';
import 'package:flutter_application/page/search/search_result_page.dart';
import 'package:flutter_application/resource/model/category_model.dart';
import 'package:flutter_application/resource/model/order_model.dart';
import 'package:flutter_application/resource/model/product_model.dart';
import 'package:flutter_application/resource/remote/checkout_remote_resource.dart';
import 'package:flutter_application/resource/remote/home_remote_resource.dart';
import 'package:flutter_application/resource/remote/order_remote_resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AuthBloc authBloc;
  final OrderRemoteResource? orderRemoteResource;
  final HomeRemoteResource? homeRemoteResource;
  final CheckoutRemoteResource? checkoutRemoteResource;

  AppRouter({
    required this.authBloc,
    this.orderRemoteResource,
    this.homeRemoteResource,
    this.checkoutRemoteResource,
  });

  static const List<String> protectedRoutes = [
    '/dashboard/order',
    '/dashboard/profile',
    '/dashboard/cart',
    '/order',
    '/order-detail',
    '/payment',
    '/checkout',
  ];

  late final GoRouter router = GoRouter(
    initialLocation: '/dashboard/home',
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: (context, state) {
      final isLoggedIn = authBloc.state is Authenticated;
      final location = state.matchedLocation;
      final isProtected =
          protectedRoutes.any((route) => location.startsWith(route));

      if (!isLoggedIn && isProtected) {
        return '/login';
      }
      if (isLoggedIn && location == '/login') {
        return '/dashboard/home';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/dashboard/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/dashboard/order',
        builder: (context, state) {
          context.read<OrderCubit>().fetchOrders();
          return const OrderPage();
        },
      ),
      GoRoute(
        path: '/dashboard/cart',
        builder: (context, state) {
          context.read<CartBloc>().add(const CartEvent.fetchCart());
          return const CartPage();
        },
      ),
      GoRoute(
        path: '/dashboard/profile',
        builder: (context, state) {
          context.read<ProfileBloc>().add(
                const ProfileEvent.loadProfile(),
              );
          return const ProfilePage();
        },
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) {
          final query = state.extra is String ? state.extra as String : '';
          return SearchResultPage(initialQuery: query);
        },
      ),
      GoRoute(
        path: '/checkout',
        builder: (context, state) {
          final remote = checkoutRemoteResource ??
              CheckoutRemoteResource(
                Dio(BaseOptions(baseUrl: AppConfig.API_PATH)),
              );

          final extra = state.extra;
          int totalPrice = 0;
          int totalWeight = 0;

          if (extra is Map) {
            totalPrice = (extra['totalPrice'] as int?) ?? 0;
            totalWeight =
                (extra['totalWeight'] ?? extra['totalweigth']) as int? ?? 0;
          }

          return MultiBlocProvider(
            providers: [
              BlocProvider<LocationCubit>(
                create: (context) => LocationCubit(remote),
              ),
              BlocProvider<ShippingCostCubit>(
                create: (context) => ShippingCostCubit(remote),
              ),
              BlocProvider<CheckoutCubit>(
                create: (context) => CheckoutCubit(remote),
              ),
            ],
            child: CheckoutPage(
              totalPrice: totalPrice,
              totalWeight: totalWeight,
            ),
          );
        },
      ),
      GoRoute(
        path: '/products',
        builder: (context, state) {
          final title =
              state.extra is String ? state.extra as String : 'All Product';

          return AllProductsPage(
            title: title,
            homeRemoteResource: homeRemoteResource ??
                HomeRemoteResource(
                  Dio(BaseOptions(baseUrl: AppConfig.API_PATH)),
                ),
          );
        },
      ),
      GoRoute(
        path: '/category-products',
        builder: (context, state) {
          final extra = state.extra;
          final remote = homeRemoteResource ??
              HomeRemoteResource(
                Dio(BaseOptions(baseUrl: AppConfig.API_PATH)),
              );

          if (extra is CategoryModel) {
            return CategoryProductsPage(
              category: extra,
              slug: extra.slug,
              categoryName: extra.name,
              homeRemoteResource: remote,
            );
          }

          return CategoryProductsPage(
            slug: extra is String ? extra : null,
            homeRemoteResource: remote,
          );
        },
      ),
      GoRoute(
        path: '/product-detail',
        builder: (context, state) {
          final extra = state.extra;
          final remote = homeRemoteResource ??
              HomeRemoteResource(
                Dio(BaseOptions(baseUrl: AppConfig.API_PATH)),
              );

          if (extra is ProductModel) {
            return ProductDetailPage(
              product: extra,
              slug: extra.slug,
              homeRemoteResource: remote,
            );
          }

          return ProductDetailPage(
            slug: extra is String ? extra : null,
            homeRemoteResource: remote,
          );
        },
      ),
      GoRoute(
        path: '/order-detail',
        builder: (context, state) {
          final extra = state.extra;

          if (extra is OrderModel) {
            return OrderDetailPage(
              snapToken: extra.snapToken,
              order: extra,
            );
          }

          return OrderDetailPage(
            snapToken: extra is String ? extra : null,
          );
        },
      ),
      GoRoute(
        path: '/payment',
        builder: (context, state) {
          final snapToken = state.extra is String ? state.extra as String : '';
          return PaymentPage(snapToken: snapToken);
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
