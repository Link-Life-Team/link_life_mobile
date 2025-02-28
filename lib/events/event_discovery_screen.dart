import 'package:flutter/material.dart';

class EventDiscoveryScreen extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      "eventName": "Blood Donation Camp",
      "hospitalName": "City Hospital",
      "address": "123 Main St, Springfield",
      "date": "2023-10-15",
      "startTime": "10:00 AM",
      "endTime": "2:00 PM",
    },
    {
      "eventName": "Health Checkup Camp",
      "hospitalName": "Green Valley Hospital",
      "address": "456 Elm St, Springfield",
      "date": "2023-10-20",
      "startTime": "9:00 AM",
      "endTime": "1:00 PM",
    },
    // Add more dummy events here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Discovery'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Card(
            color: Colors.red[50],
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event['eventName']!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text("Hospital: ${event['hospitalName']}"),
                  Text("Address: ${event['address']}"),
                  Text("Date: ${event['date']}"),
                  Text("Time: ${event['startTime']} - ${event['endTime']}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
