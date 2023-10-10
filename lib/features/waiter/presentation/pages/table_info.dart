import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TableInfo extends StatelessWidget {
  final Object? tableNumber; // Receive the table number as an argument

  TableInfo({required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    // Generate QR code data using the table number
    String qrData = 'Table $tableNumber QR code data';
    if (tableNumber is String == false) {
      context.pop();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Mesa $tableNumber', // Display the table number
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            QrImageView(
              padding: const EdgeInsets.only(top: 20.0),
              data: qrData,
              version: QrVersions.auto,
              size: 320,
              gapless: false,
              embeddedImageStyle: const QrEmbeddedImageStyle(
                size: Size(80, 80),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Scan this QR code'),
          ],
        ),
      ),
    );
  }
}
