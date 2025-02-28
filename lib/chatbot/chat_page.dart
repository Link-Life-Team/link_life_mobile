import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatUser _currentUser = ChatUser(
    id: '1',
    firstName: 'User',
    lastName: 'user',
  );
  final ChatUser _gptChatUser = ChatUser(
    id: '2',
    firstName: "Chat",
    lastName: 'Bot',
  );

  final List<ChatMessage> _messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Chatbot', style: TextStyle(color: Colors.white)),
      ),
      body: DashChat(
        currentUser: _currentUser,
        messageOptions: const MessageOptions(
          currentUserContainerColor: Colors.black,
          containerColor: Colors.red,
          textColor: Colors.white,
        ),
        onSend: (ChatMessage m) {
          getChatResponse(m);
        },
        messages: _messages,
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
    });

    List<Map<String, String>> messageHistory = _messages.reversed.map((m) {
      if (m.user == _currentUser) {
        return {"role": "user", "content": m.text};
      } else {
        return {"role": "assistant", "content": m.text};
      }
    }).toList();

    final response = await http.post(
      Uri.parse('https://models.github.ai/inference/chat/completions'),
      headers: {
        'Authorization': 'Bearer ${dotenv.env['GITHUB_TOKEN']}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "messages": messageHistory,
        "model": "gpt-4o",
        "temperature": 1,
        "max_tokens": 4096,
        "top_p": 1,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      for (var element in responseBody['choices']) {
        setState(() {
          _messages.insert(
            0,
            ChatMessage(
              user: _gptChatUser,
              createdAt: DateTime.now(),
              text: element['message']['content'],
            ),
          );
        });
      }
    } else {
      // Handle error
      print('Error: ${response.body}');
    }
  }
}
