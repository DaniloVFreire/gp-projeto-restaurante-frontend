import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sobre_mesa/core/constants/texts.dart';
import 'package:sobre_mesa/core/constants/urls.dart';
import 'package:sobre_mesa/core/utils/image_manager.dart';
import 'package:sobre_mesa/core/widgets/cart_notifier.dart';
import 'package:sobre_mesa/features/customer/domain/entities/cart.dart';
import 'package:sobre_mesa/features/customer/domain/entities/product.dart';
import 'package:sobre_mesa/features/customer/data/menu_remote_data_source.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Color buttonColor = Colors.deepOrange.shade500;
  ImageManager imgManager = ImageManager();
  int maxPictureId = 0;
  MenuRemoteDataSource remoteDataSource = MenuRemoteDataSource();
  Image homeImage = Image.asset(
    './assets/cafe_home.webp',
    scale: 0.8,
    fit: BoxFit.cover,
    height: 100,
  );

  @override
  void initState() {
    super.initState();

    imgManager.populateImagesManually();
  }

  @override
  Widget build(BuildContext context) {
    maxPictureId = imgManager.images.length;
    return Consumer<CartNotifier>(builder: (context, cart, child) {
      return Scaffold(
        body: Stack(alignment: Alignment.bottomCenter, children: [
          ListView.builder(
              itemCount: cart.products.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Stack(alignment: Alignment.topCenter, children: [
                    SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: homeImage,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'SobreMesa',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          height: 86,
                          child: productCard(index, cart)),
                    ),
                  ]);
                }
                return Container(
                    height: 86,
                    color: Colors.white,
                    child: productCard(index, cart));
              }),
          if (cart.totalPrice > 0)
            Positioned(
              bottom: 10,
              child: RawMaterialButton(
                  fillColor: buttonColor,
                  onPressed: () {
                    context.goNamed(RouteNames.cartPage, extra: cart.products);
                  },
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                            "${Texts.addToCart} ${Texts.totalBRL} ${cart.totalPrice.toStringAsFixed(2).replaceAll('.', ',')}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ],
                    ),
                  )),
            ),
        ]),
      );
    });
  }

  Widget productCard(int index, CartNotifier cart) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 30,
            child: GestureDetector(
              onTap: () {
                context.go(Urls.productDetailsPage,
                    extra: cart.products[index]);
              },
              child: Expanded(
                flex: 20,
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 2,
                      ),
                      Flexible(
                          flex: 8,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: imgManager
                                  .images[cart.products[index].pictureId])),
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
                              cart.products[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                child: Text(
                              cart.products[index].description,
                              overflow: TextOverflow.ellipsis,
                            )),
                            Flexible(
                                child: Text(
                                    '${Texts.totalBRL} ${cart.products[index].price.toStringAsFixed(2).replaceAll('.', ',')}')),
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
            ),
          ),
          Flexible(
            flex: 2,
            child: RawMaterialButton(
              constraints: BoxConstraints.tight(const Size(20, 20)),
              onPressed: () {
                setState(() {
                  cart.removeProduct(id: cart.products[index].id);
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
                  cart.products[index].quantity.toString(),
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
                  cart.addProduct(id: cart.products[index].id);
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
