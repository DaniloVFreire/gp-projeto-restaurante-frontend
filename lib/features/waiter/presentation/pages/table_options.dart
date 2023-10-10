import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sobre_mesa/core/constants/urls.dart';
import 'package:sobre_mesa/features/waiter/presentation/pages/qr_code.dart';

class TableOptions extends StatefulWidget {
  const TableOptions({super.key});
  @override
  State<TableOptions> createState() => _TableOptionsState();
}

class _TableOptionsState extends State<TableOptions> {
  int _selectedIndex =
      0; // Default selected index for the bottom navigation bar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 150),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Mesas',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildTableButton(1, false),
                  buildTableButton(2, true),
                  buildTableButton(3, false),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.table_bar),
            label: 'Mesas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Feed de pedidos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget buildTableButton(int tableNumber, bool beingUsed) {
    return Container(
      width: 100,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          if (beingUsed) {
            context.pushNamed(RouteNames.tableQrCodePage,
                extra: tableNumber.toString());
          } else {
            context.pushNamed(RouteNames.tableInfoPage,
                extra: tableNumber.toString());
          }
        },
        child: Text(
          'Mesa $tableNumber',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Add actions for each button here, based on the selected index
      if (index == 1) {
        // Handle Button 2 action
        context.go(Urls.ordersFeedPage);
      }
    });
  }
}
