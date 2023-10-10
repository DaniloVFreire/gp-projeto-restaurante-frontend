class Product {
  Product(
      {required this.name,
      required this.description,
      required this.price,
      required this.pictureId,
      required this.id});
  final String name;
  final String description;
  final double price;
  int _quantity = 0;
  final int pictureId;
  final String id;
  decrementQuantity({quantity}) {
    if (_quantity > 0) {
      _quantity--;
    }
  }

  incrementQuantity({quantity}) {
    _quantity++;
  }

  int get quantity => _quantity;
}
