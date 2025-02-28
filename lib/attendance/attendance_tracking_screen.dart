import 'package:flutter/material.dart';

class AttendanceTrackingScreen extends StatelessWidget {
  const AttendanceTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Attendance Tracking')),
      body: Center(child: Text('Track Volunteers')),
    );
  }
}
