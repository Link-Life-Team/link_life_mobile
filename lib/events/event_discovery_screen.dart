import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

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
  ];

  EventDiscoveryScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Discovery'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: events.length,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
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
                    leading: Icon(Icons.event, color: Colors.red),
                    title: Text(
                      event['eventName']!,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text("Hospital: ${event['hospitalName']}"),
                        Text("Address: ${event['address']}"),
                        Text("Date: ${event['date']}"),
                        Text(
                            "Time: ${event['startTime']} - ${event['endTime']}"),
                      ],
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
                      child: Text("View Details"),
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

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatUser _currentUser = ChatUser(id: '1', firstName: 'User');
  final ChatUser _gptChatUser = ChatUser(id: '2', firstName: "ChatBot");

  final List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Chatbot', style: TextStyle(color: Colors.white)),
      ),
      body: DashChat(
        currentUser: _currentUser,
        messageOptions: const MessageOptions(
          currentUserContainerColor: Colors.black,
          containerColor: Colors.red,
          textColor: Colors.white,
        ),
        onSend: (ChatMessage m) {
          setState(() {
            _messages.insert(0, m);
          });
        },
        messages: _messages,
      ),
    );
  }
}
