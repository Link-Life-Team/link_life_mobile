import 'package:flutter/material.dart';

class EventManagementScreen extends StatelessWidget {
  const EventManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event Management')),
      body: Center(child: Text('Manage Blood Donation Events')),
    );
  }
}
