import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/app_router.dart';
import 'package:flutter_application/bloc/auth/auth_bloc.dart';
import 'package:flutter_application/bloc/cart/cart_bloc.dart';
import 'package:flutter_application/bloc/category/category_cubit.dart';
import 'package:flutter_application/bloc/order/order_cubit.dart';
import 'package:flutter_application/bloc/product/product_cubit.dart';
import 'package:flutter_application/bloc/profile/profile_bloc.dart';
import 'package:flutter_application/bloc/slider/slider_cubit.dart';
import 'package:flutter_application/core/constants/app_config.dart';
import 'package:flutter_application/core/utils/auth_interceptor.dart';
import 'package:flutter_application/resource/remote/auth_remote_resource.dart';
import 'package:flutter_application/resource/remote/cart_remote_resource.dart';
import 'package:flutter_application/resource/remote/checkout_remote_resource.dart';
import 'package:flutter_application/resource/remote/home_remote_resource.dart';
import 'package:flutter_application/resource/remote/order_remote_resource.dart';
import 'package:flutter_application/resource/remote/profile_remote_resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = Dio(BaseOptions(baseUrl: AppConfig.API_PATH));
  dio.interceptors.add(AuthInterceptor());

  final homeRemoteResource = HomeRemoteResource(dio);
  final profileRemoteResource = ProfileRemoteResource(dio);
  final authRemoteResource = AuthRemoteResource(dio);
  final orderRemoteResource = OrderRemoteResource(dio);
  final cartRemoteResource = CartRemoteResource(dio);
  final checkoutRemoteResource = CheckoutRemoteResource(dio);

  final authBloc = AuthBloc(authRemoteResource)
    ..add(const AuthEvent.checkLoginStatus());
  final appRouter = AppRouter(
    authBloc: authBloc,
    orderRemoteResource: orderRemoteResource,
    homeRemoteResource: homeRemoteResource,
    checkoutRemoteResource: checkoutRemoteResource,
  );

  runApp(
    MyApp(
      appRouter: appRouter,
      authBloc: authBloc,
      profileRemoteResource: profileRemoteResource,
      orderRemoteResource: orderRemoteResource,
      homeRemoteResource: homeRemoteResource,
      cartRemoteResource: cartRemoteResource,
      checkoutRemoteResource: checkoutRemoteResource,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final AuthBloc authBloc;
  final ProfileRemoteResource profileRemoteResource;
  final OrderRemoteResource orderRemoteResource;
  final HomeRemoteResource homeRemoteResource;
  final CartRemoteResource cartRemoteResource;
  final CheckoutRemoteResource checkoutRemoteResource;

  const MyApp({
    super.key,
    required this.appRouter,
    required this.authBloc,
    required this.profileRemoteResource,
    required this.orderRemoteResource,
    required this.homeRemoteResource,
    required this.cartRemoteResource,
    required this.checkoutRemoteResource,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>.value(value: authBloc),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(profileRemoteResource),
        ),
        BlocProvider<OrderCubit>(
          create: (context) => OrderCubit(orderRemoteResource),
        ),
        BlocProvider<SliderCubit>(
          create: (context) => SliderCubit(homeRemoteResource),
        ),
        BlocProvider<CategoryCubit>(
          create: (context) => CategoryCubit(homeRemoteResource),
        ),
        BlocProvider<ProductCubit>(
          create: (context) => ProductCubit(homeRemoteResource),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(cartRemoteResource),
        ),
      ],
      child: MaterialApp.router(
        title: 'Food Store',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade100,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
          useMaterial3: true,
        ),
        routerConfig: appRouter.router,
      ),
    );
  }
}