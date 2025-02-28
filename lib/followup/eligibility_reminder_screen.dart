import 'package:flutter/material.dart';

class EligibilityReminderScreen extends StatelessWidget {
  const EligibilityReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eligibility Reminder')),
      body: Center(child: Text('Next Donation Date Reminder')),
    );
  }
}
