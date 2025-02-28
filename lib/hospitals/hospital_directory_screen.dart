import 'package:flutter/material.dart';

class HospitalDirectoryScreen extends StatelessWidget {
  const HospitalDirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hospital Directory')),
      body: Center(child: Text('List of Hospitals')),
    );
  }
}
