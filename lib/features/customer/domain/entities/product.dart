
class Product{
  Product({required this.name, required this.description, required this.price, required this.pictureId});
  final String name;
  final String description;
  final double price;
  int _quantity = 0;
  final int pictureId;
  decrementQuantity(){
    if(_quantity > 0){
      _quantity --;
    }
  }
  incrementQuantity(){
      _quantity ++;
  }
  get quantity => _quantity;
}