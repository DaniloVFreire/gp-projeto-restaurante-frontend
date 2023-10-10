import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sobre_mesa/core/widgets/cart_notifier.dart';
import 'package:sobre_mesa/features/customer/data/menu_remote_data_source.dart';
import 'package:sobre_mesa/features/customer/domain/entities/product.dart';
import 'package:sobre_mesa/features/customer/presentation/pages/qr_code.dart';
import 'features/customer/presentation/pages/cart.dart';
import 'package:sobre_mesa/core/constants/texts.dart';
import 'package:sobre_mesa/core/constants/urls.dart';
import 'package:sobre_mesa/features/customer/presentation/pages/login_qr.dart';
import 'package:sobre_mesa/features/customer/presentation/pages/menu.dart';
import 'package:sobre_mesa/features/customer/presentation/pages/product_details.dart';
import 'package:sobre_mesa/features/customer/presentation/pages/table_options.dart';
import 'features/shared/presentation/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MenuRemoteDataSource remoteDataSource = MenuRemoteDataSource();
    final products = remoteDataSource.getMenuProductsList();
    CartNotifier cartNotifier = CartNotifier(products: products);
    final router = GoRouter(initialLocation: Urls.qrcodePage, routes: [
      GoRoute(
          name: RouteNames.loginPage,
          path: Urls.loginPage,
          builder: (context, state) => const Login()),
      GoRoute(
          name: RouteNames.qrcodePage,
          path: Urls.qrcodePage,
          builder: (context, state) => const LoginQR()),
      GoRoute(
          name: RouteNames.tableOptions,
          path: Urls.tableOptions,
          builder: (context, state) => const TableOptions()),
      GoRoute(
          name: RouteNames.productDetailsPage,
          path: Urls.productDetailsPage,
          builder: (context, state) => ProductDetails(
                product: state.extra,
              )),
      GoRoute(
          name: RouteNames.cartPage,
          path: Urls.cartPage,
          builder: (context, state) => Cart(
                productsList: state.extra,
              )),
      GoRoute(
        name: RouteNames.menuPage,
        path: Urls.menuPage,
        builder: (context, state) => ChangeNotifierProvider.value(
          value: cartNotifier,
          child: const Menu(),
        ),
      ),
    ]);
    return MaterialApp.router(
      routerConfig: router,
      title: Texts.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFFF8A65),
          secondary: const Color(0xFFFFC107),
        ),
      ),
    );
  }
}
