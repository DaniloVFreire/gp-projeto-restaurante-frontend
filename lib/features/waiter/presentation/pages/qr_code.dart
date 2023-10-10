import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TableQrcodePage extends StatelessWidget {
  final Object? tableNumber; // Receive the table number as an argument

  TableQrcodePage({required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    String? tableNumberString;
    if (tableNumber is String) {
      tableNumberString = tableNumber as String;
    } else {
      context.pop();
    }
    // Generate QR code data using the table number
    String qrData = 'Table $tableNumberString QR code data';

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
            Center(
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                ),
                child: TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Center(
                    child: Text(
                      'Fechar conta',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
