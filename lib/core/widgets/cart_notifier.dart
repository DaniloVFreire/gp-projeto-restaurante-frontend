import 'package:flutter/material.dart';
import 'package:sobre_mesa/features/customer/domain/entities/product.dart';

class CartNotifier extends ChangeNotifier {
  CartNotifier({required this.products});

  List<Product> products;
  double get totalPrice {
    double total = 0;
    for (final product in products) {
      total += product.price * product.quantity;
    }
    return total;
  }

  void addProduct({required String id}) {
    final List<Product> selectedProduct =
        products.where((product) => product.id == id).toList();
    selectedProduct[0].incrementQuantity();
    notifyListeners();
  }

  void removeProduct({required String id}) {
    final List<Product> selectedProduct =
        products.where((product) => product.id == id).toList();
    selectedProduct[0].decrementQuantity();
    notifyListeners();
  }
}
