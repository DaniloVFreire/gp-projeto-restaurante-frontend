import 'package:flutter/material.dart';
import 'package:sobre_mesa/features/customer/domain/entities/product.dart';

class CartNotifier extends ChangeNotifier {
  CartNotifier({required this.products});

  List<Product> products;

  void addProduct(String id) {
    final List<Product> selectedProduct =
        products.where((product) => product.id == id).toList();
    selectedProduct[0].incrementQuantity();
    notifyListeners();
  }

  void removeProduct(String id) {
    final List<Product> selectedProduct =
        products.where((product) => product.id == id).toList();
    selectedProduct[0].decrementQuantity();
    notifyListeners();
  }
}
