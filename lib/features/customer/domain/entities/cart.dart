
import 'package:sobre_mesa/features/customer/domain/entities/product.dart';

class Cart{
  Cart({required this.productsMap, required this.productsList});
  Map<String, Product> productsMap;
  List<Product> productsList;
  int _totalQuantity = 0;
  double _totalPrice = 0.0;
  decrementQuantity({required Product product, int? quantity}){
    if(_totalQuantity > 0){
      _totalQuantity --;
      _totalPrice -= product.price;
      product.decrementQuantity();
    }
  }
  incrementQuantity({required Product product, int? quantity}){
    _totalQuantity ++;
    _totalPrice += product.price;
    product.incrementQuantity();
  }
  get totalPrice => _totalPrice;
  get totalQuantity => _totalQuantity;
}