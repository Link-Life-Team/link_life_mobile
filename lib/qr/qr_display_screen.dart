import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRDisplayScreen extends StatelessWidget {
  final String qrData = "Sample QR Code Data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Code Display')),
      body: Center(
        child: QrImageView(data: qrData, version: QrVersions.auto, size: 200.0),
      ),
    );
  }
}
