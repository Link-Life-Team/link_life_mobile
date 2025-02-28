import 'package:flutter/material.dart';

class VolunteerTrackingScreen extends StatelessWidget {
  const VolunteerTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Volunteer Tracking')),
      body: Center(child: Text('Track Volunteers & Engagement')),
    );
  }
}
