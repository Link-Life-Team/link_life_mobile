import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:link_life/chatbot/chat_page.dart';
import 'package:share_plus/share_plus.dart';

class EventDiscoveryScreen extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      "eventName": "Blood Donation Camp",
      "hospitalName": "City Hospital",
      "address": "123 Main St, Springfield",
      "date": "2023-10-15",
      "startTime": "10:00 AM",
      "endTime": "2:00 PM",
      "eventLink": "https://www.bloodcamp.com/event1"
    },
    {
      "eventName": "Health Checkup Camp",
      "hospitalName": "Green Valley Hospital",
      "address": "456 Elm St, Springfield",
      "date": "2023-10-20",
      "startTime": "9:00 AM",
      "endTime": "1:00 PM",
      "eventLink": "https://www.healthcamp.com/event2"
    },
  ];

  EventDiscoveryScreen({super.key});

  void _openShareOptions(BuildContext context, Map<String, String> event) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Share ${event['eventName']}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 15,
                children: [
                  _buildShareButton(
                      context, FontAwesomeIcons.whatsapp, "WhatsApp", () {
                    // FlutterShareMe().shareToWhatsApp(
                    //   msg: _getShareMessage(event),
                    // );
                    Share.share(event['eventLink']!);
                  }),
                  _buildShareButton(context, Icons.facebook, "Facebook", () {
                    // FlutterShareMe().shareToFacebook(
                    //   url: event['eventLink']!,
                    //   msg: _getShareMessage(event),
                    // );
                    Share.share(event['eventLink']!);
                  }),
                  _buildShareButton(context, Icons.email, "Email", () {
                    Share.share(
                      _getShareMessage(event),
                      subject: "Join this Event: ${event['eventName']}",
                    );
                  }),
                  _buildShareButton(context, Icons.message, "SMS", () {
                    // FlutterShareMe().shareToSystem(
                    //   msg: _getShareMessage(event),
                    // );
                    Share.share(event['eventLink']!);
                  }),
                  _buildShareButton(context, Icons.copy, "Copy Link", () {
                    Share.share(event['eventLink']!);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Event link copied to clipboard!"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _openChatModal(BuildContext context) {
    showModalBottomSheet(
      context: context,

      isScrollControlled: true, // Full-screen modal

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),

      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.9, // 90% height

        child: ChatPage(),
      ),
    );
  }

  String _getShareMessage(Map<String, String> event) {
    return '''
📅 *${event['eventName']}*
🏥 ${event['hospitalName']}
📍 ${event['address']}
📆 Date: ${event['date']}
⏰ Time: ${event['startTime']} - ${event['endTime']}

🔗 Join us: ${event['eventLink']} ❤️
''';
  }

  Widget _buildShareButton(
      BuildContext context, IconData icon, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.red.shade100,
            child: Icon(icon, size: 30, color: Colors.red),
          ),
          const SizedBox(height: 8),
          Text(text, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Discovery'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: events.length,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        itemBuilder: (context, index) {
          final event = events[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(Icons.event, color: Colors.red),
                    title: Text(
                      event['eventName']!,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text("🏥 Hospital: ${event['hospitalName']}"),
                        Text("📍 Address: ${event['address']}"),
                        Text("📆 Date: ${event['date']}"),
                        Text(
                            "⏰ Time: ${event['startTime']} - ${event['endTime']}"),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.share, color: Colors.red),
                      onPressed: () => _openShareOptions(context, event),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("View Details"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.chat, color: Colors.white),
        onPressed: () => _openChatModal(context),
      ),
    );
  }
}
