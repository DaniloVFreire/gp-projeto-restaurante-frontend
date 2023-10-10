import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sobre_mesa/core/constants/texts.dart';
import 'package:sobre_mesa/core/constants/urls.dart';
import 'package:sobre_mesa/core/utils/image_manager.dart';
import 'package:sobre_mesa/core/widgets/cart_notifier.dart';
import 'package:sobre_mesa/features/customer/data/menu_remote_data_source.dart';
import 'package:sobre_mesa/features/customer/domain/entities/product.dart';
import 'package:sobre_mesa/features/shared/data/login_remote_data_source.dart';
import 'package:sobre_mesa/features/shared/domain/entities/login_data.dart';

class Cart extends StatefulWidget {
  Cart({super.key, this.productsList});
  Object? productsList;
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final TextEditingController email = TextEditingController();
  final TextEditingController passWord = TextEditingController();
  Color buttonColor = Colors.deepOrange.shade500;
  late MenuRemoteDataSource dataSource = MenuRemoteDataSource();
  late ImageManager imageManager = ImageManager();
  List<Product> products = [];
  @override
  void initState() {
    imageManager.populateImagesManually();
    //Get user from cache
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.productsList is List<Product>) {
      products = widget.productsList as List<Product>;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text("Carrinho"),
      // ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[productCard(products)]),
      ),
    );
  }

  Widget productCard(List<Product> products) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            "Carrinho",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 57,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 10, child: Text(products[index].name)),
                        Expanded(
                            flex: 2,
                            child: Text(products[index].quantity.toString())),
                        Expanded(
                          flex: 2,
                          child: Text(
                              (products[index].price * products[index].quantity)
                                  .toString()),
                        )
                      ],
                    ),
                  );
                },
              )),
        ),
        Center(
          child: Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: () {
                context.go(Urls.menuPage);
              },
              child: const Center(
                child: Text(
                  'Voltar',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
        ),
        //Container(
        //   color: Colors.red,
        //   width: 30,
        //   height: 30,
        //   child: InkWell(
        //     child: Text(products[0].name),
        //     onTap: () {
        //       context.go(Urls.menuPage);
        //     },
        //   ),
        // );
      ],
    );
  }
}
