import 'package:flutter/material.dart';

class Menu extends StatefulWidget{
  const Menu({super.key, required this.title});

  final String title;

  @override
  State<Menu> createState() => _MenuState();

}

class _MenuState extends State<Menu> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: ListView.builder(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 80,
            color: Colors.amber[colorCodes[index]],
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(color: Colors.black,width: 70, height: 70,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('nome do produto'),
                      Text('Descrição do produto'),
                      Row(
                        children: [
                          RawMaterialButton(
                            constraints: BoxConstraints.tight(const Size(30, 20)),
                            onPressed: () {},
                            elevation: 1.0,
                            fillColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(18.0),
                                           side: const BorderSide(color: Colors.red)
                                       ),
                            child: const Icon(
                              Icons.add,
                              size: 20.0,
                            ),
                          ),
                        ],
                      )
                  ],),
                ]
            ),
          );
      }
      )
    );
  }
}