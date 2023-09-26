import 'package:flutter/material.dart';
import 'features/customer/presentation/pages/cart.dart';
import 'package:sobre_mesa/core/constants/texts.dart';
import 'package:sobre_mesa/features/customer/presentation/pages/menu.dart';
import 'features/customer/presentation/pages/login.dart';
import 'features/customer/presentation/pages/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Menu(),
        '/login': (context) => const Login(),
      },
      initialRoute: '/',
      title:Texts.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFFF8A65),
          secondary: const Color(0xFFFFC107),
        ),
      ),
    );
  }
}
