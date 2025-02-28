import 'package:flutter/material.dart';

class RecoveryTipsScreen extends StatelessWidget {
  const RecoveryTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recovery Tips')),
      body: Center(child: Text('Tips for Post-Donation Recovery')),
    );
  }
}
