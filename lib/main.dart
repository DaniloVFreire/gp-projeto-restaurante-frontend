import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sobre_mesa/core/widgets/cart_notifier.dart';
import 'package:sobre_mesa/features/customer/data/menu_remote_data_source.dart';
import 'features/customer/presentation/pages/cart.dart';
import 'package:sobre_mesa/core/constants/texts.dart';
import 'package:sobre_mesa/core/constants/urls.dart';
import 'package:sobre_mesa/features/customer/presentation/pages/login_qr.dart';
import 'package:sobre_mesa/features/customer/presentation/pages/menu.dart';
import 'package:sobre_mesa/features/customer/presentation/pages/product_details.dart';
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
    return ChangeNotifierProvider(
      create: (context) =>
          CartNotifier(products: remoteDataSource.getMenuProductsList()),
      child: MaterialApp(
        routes: {
          Urls.loginPage: (context) => const Login(),
          Urls.qrcodePage: (context) => const LoginQR(),
          Urls.menuPage: (context) => const Menu(),
          Urls.productDetailsPage: (context) => ProductDetails(),
          Urls.cartPage: (context) => Cart(),
        },
        initialRoute: Urls.menuPage,
        title: Texts.appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFFFF8A65),
            secondary: const Color(0xFFFFC107),
          ),
        ),
      ),
    );
  }
}
