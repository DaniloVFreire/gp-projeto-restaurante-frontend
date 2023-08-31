import 'package:flutter/material.dart';
import 'package:sobre_mesa/core/utils/image_manager.dart';
import 'package:sobre_mesa/features/customer/data/remote_data_source.dart';
import 'package:sobre_mesa/features/customer/domain/entities/product.dart';

class Menu extends StatefulWidget{
  const Menu({super.key, required this.title});

  final String title;

  @override
  State<Menu> createState() => _MenuState();

}

class _MenuState extends State<Menu> {
  Color color = Colors.deepOrange.shade500;
  List<Product> products = [];
  ImageManager imgManager = ImageManager();
  int maxPictureId=0;
  MenuRemoteDataSource remoteDataSource = MenuRemoteDataSource();
  Image homeImage = Image.asset('./assets/cafe_home.webp',scale:0.8,fit: BoxFit.cover,height: 100,);
  @override
  void initState() {
    super.initState();
    imgManager.populateImagesManually();
    products = remoteDataSource.getMenuProducts();
    maxPictureId = imgManager.images.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              if(index == 0){
                return Stack(
                  alignment: Alignment.topCenter,
                    children: [
                      SizedBox(width: double.infinity, height: 250, child: homeImage,),
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text('Sobre Mesa', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w300), ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 200),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                          ),
                        height: 86,
                        child: productCard(index)
                    ),
                      )]);
              }
              return Container(
                height: 86,
                color: Colors.white,
                child: productCard(index)
              );
            }
        ),
    );
  }
  Widget productCard(int index){
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(flex: 2,),
          Flexible(
              flex: 8,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: imgManager.images[products[index].pictureId]
              )
          ),
          const Spacer(flex: 2,),
          Expanded(
            flex: 18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(child: Text(products[index].name, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
                Flexible(child: Text(products[index].description, overflow: TextOverflow.ellipsis,)),
                Flexible(child: Text('R\$ ${products[index].price.toStringAsFixed(2).replaceAll('.', ',')}')),
              ],),
          ),
          const Spacer(flex: 2,),
          Flexible(
            flex: 2,
            child: RawMaterialButton(
              constraints: BoxConstraints.tight(const Size(20, 20)),
              onPressed: () {
                setState(() {
                  products[index].decrementQuantity();

                });
              },
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: color)
              ),
              child: const Icon(
                Icons.remove,
                size: 20.0,
              ),
            ),
          ),
          const Spacer(flex: 1,),
          Flexible(
            flex: 2,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                constraints: const BoxConstraints(minWidth: 18, maxHeight: 18),
                decoration: BoxDecoration(
                  color:  color,
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                ),
                child: Center(child: Text(products[index].quantity.toString(), style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.white),textAlign: TextAlign.center,)),
              ),
            ),
          ),
          const Spacer(flex: 1,),
          Flexible(
            flex: 2,
            child: RawMaterialButton(
              constraints: BoxConstraints.tight(const Size(20, 20)),
              onPressed: () {
                setState(() {
                  products[index].incrementQuantity();
                });
              },
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: color)
              ),
              child: const Icon(
                Icons.add,
                size: 20.0,
              ),
            ),
          ),
          const Spacer(flex: 1,),
        ]
    );
  }
}