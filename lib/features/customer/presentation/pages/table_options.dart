import 'package:flutter/material.dart';
import 'package:sobre_mesa/features/customer/presentation/pages/qr_code.dart';

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
                  buildTableButton(1),
                  buildTableButton(2),
                  buildTableButton(3),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Button 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Button 2',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget buildTableButton(int tableNumber) {
    return Container(
      width: 100,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          // Open the QR code page with the corresponding table number
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QrcodePage(tableNumber: tableNumber),
            ),
          );
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
      if (index == 0) {
        // Handle Button 1 action
      } else if (index == 1) {
        // Handle Button 2 action
      }
    });
  }
}
