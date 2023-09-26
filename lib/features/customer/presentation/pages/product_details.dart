import 'package:flutter/material.dart';
import 'package:sobre_mesa/core/constants/texts.dart';
import 'package:sobre_mesa/core/constants/urls.dart';
import 'package:sobre_mesa/core/utils/image_manager.dart';
import 'package:sobre_mesa/features/customer/data/menu_remote_data_source.dart';
import 'package:sobre_mesa/features/customer/domain/entities/product.dart';
import 'package:sobre_mesa/features/shared/data/login_remote_data_source.dart';
import 'package:sobre_mesa/features/shared/domain/entities/login_data.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key, this.arguments});
  Product? arguments;
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late MenuRemoteDataSource dataSource = MenuRemoteDataSource();
  ImageManager imgManager = ImageManager();
  late List<Product> productsList;
  late Product product;
  Color buttonColor = Colors.deepOrange.shade500;
  @override
  void initState() {
    productsList = dataSource.getMenuProductsList();
    imgManager.populateImagesManually();
    product = Product(
        name: 'Panqueca de chocolate',
        description:
            'Deliciosas panquecas, com brigadeiro e fatias de morango.',
        price: 16.50,
        pictureId: 0,
        id: 'Panqueca de chocolate');
    //Get user from cache
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Descrição do produto"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                child: imgManager.images[product.pictureId]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              product.name,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              product.description,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              'Preço: ' + 'R\$' + product.price.toString(),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          //productCard(product),
        ],
      ),
    );
  }

  Widget productCard(product) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Urls.loginPage);
              },
              child: Row(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Flexible(
                      flex: 8,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: imgManager.images[product.pictureId])),
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 18,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                            child: Text(
                          product.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                        Flexible(
                            child: Text(
                          product.description,
                          overflow: TextOverflow.ellipsis,
                        )),
                        Flexible(
                            child: Text(
                                'R\$ ${product.price.toStringAsFixed(2).replaceAll('.', ',')}')),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: RawMaterialButton(
              constraints: BoxConstraints.tight(const Size(20, 20)),
              onPressed: () {
                setState(() {
                  //cart.decrementQuantity(product: product);
                });
              },
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: buttonColor)),
              child: const Icon(
                Icons.remove,
                size: 20.0,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Flexible(
            flex: 2,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                constraints: const BoxConstraints(minWidth: 18, maxHeight: 18),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                ),
                child: Center(
                    child: Text(
                  product.quantity.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Flexible(
            flex: 2,
            child: RawMaterialButton(
              constraints: BoxConstraints.tight(const Size(20, 20)),
              onPressed: () {
                setState(() {
                  //cart.incrementQuantity(product: product);
                });
              },
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: buttonColor)),
              child: const Icon(
                Icons.add,
                size: 20.0,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ]);
  }
}
