import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sobre_mesa/core/constants/urls.dart';
import 'package:sobre_mesa/features/customer/domain/entities/product.dart';
import 'package:sobre_mesa/features/waiter/presentation/pages/qr_code.dart';

class OrdersFeed extends StatefulWidget {
  const OrdersFeed({super.key});

  @override
  State<OrdersFeed> createState() => _OrdersFeedState();
}

class _OrdersFeedState extends State<OrdersFeed> {
  int _selectedIndex = 1;
  // Default selected index for the bottom navigation bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            final product = Product(
              name: 'Algo',
              description: 'alguma coisa',
              price: 10.0,
              pictureId: 1,
              id: '3',
            );
            product.incrementQuantity();
            return orderCard(product, 'Em andamento', '1');
          }),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Feed de pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_bar),
            label: 'Mesas',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget orderCard(Product product, String status, String tablenumber) {
    return Container(
        height: 86,
        color: Colors.white,
        child: Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Text("mesa: $tablenumber"),
              Text("produto:${product.name}"),
              Text("quantidade: ${product.quantity}"),
              Text("${status}"),
            ])));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Add actions for each button here, based on the selected index
      if (index == 0) {
        // Handle Button 1 action
        context.go(Urls.tableOptionsPage);
      }
    });
  }
}
