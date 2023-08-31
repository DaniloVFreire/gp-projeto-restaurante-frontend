import 'package:flutter/material.dart';
import 'package:sobre_mesa/features/customer/domain/entities/product.dart';

class Menu extends StatefulWidget{
  const Menu({super.key, required this.title});

  final String title;

  @override
  State<Menu> createState() => _MenuState();

}

class _MenuState extends State<Menu> {
  int _counter = 0;
  Color color = Colors.deepOrange.shade500;
  List<Product> products = [Product(name: 'Bolo de chocolate', description: 'Deliciosas lâminas de chocolate 90% cacau', price: 15.00, pictureId: 0),];


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  void initState() {
    super.initState();
    for(int i = 0 ; i < 20; i++){
      final product = Product(name: 'Bolo de chocolate', description: 'Deliciosas lâminas de chocolate 90% cacau', price: 15.00, pictureId: 0);
      products.add(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 86,
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Spacer(flex: 2,),
                    Flexible(
                      flex: 8,
                      child: Container(width: 70, height: 70,
                        decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),),
                    ),
                    Spacer(flex: 2,),
                    Flexible(
                      flex: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(child: Text(products[index].name, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
                          Flexible(child: Text(products[index].description, overflow: TextOverflow.ellipsis,)),
                          Flexible(child: Text('R\$ 80,00')),
                      ],),
                    ),
                    Spacer(flex: 2,),
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
                    Spacer(flex: 1,),
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
                    Spacer(flex: 1,),
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
                    Spacer(flex: 1,),
                  ]
              ),
            );
        }
        ),]
      )
    );
  }
}