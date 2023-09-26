import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Cart")));
  }
}