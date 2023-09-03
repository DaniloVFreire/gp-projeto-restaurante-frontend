import 'package:flutter/material.dart';
import 'features/customer/presentation/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sobre mesa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFFF8A65),
          secondary: const Color(0xFFFFC107),
        ),
      ),
      home: const Login(title: 'Login'),
    );
  }
}
