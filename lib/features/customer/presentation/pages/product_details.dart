import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sobre_mesa/core/constants/texts.dart';
import 'package:sobre_mesa/core/constants/urls.dart';
import 'package:sobre_mesa/core/utils/image_manager.dart';
import 'package:sobre_mesa/features/customer/data/menu_remote_data_source.dart';
import 'package:sobre_mesa/features/customer/domain/entities/product.dart';
import 'package:sobre_mesa/features/shared/data/login_remote_data_source.dart';
import 'package:sobre_mesa/features/shared/domain/entities/login_data.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key, this.product});
  Object? product;
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late MenuRemoteDataSource dataSource = MenuRemoteDataSource();
  ImageManager imgManager = ImageManager();
  Product? product;
  Color buttonColor = Colors.deepOrange.shade500;
  @override
  void initState() {
    imgManager.populateImagesManually();
    //Get user from cache
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.product is Product) {
      product = widget.product as Product;
    } else {
      context.go(Urls.menuPage);
    }
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
                child: imgManager.images[product!.pictureId]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              product!.name,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              product!.description,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              'Preço: ' + 'R\$' + product!.price.toString(),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () {
              context.go(Urls.menuPage);
            },
            child: const Text(
              'Usar Mesa',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
