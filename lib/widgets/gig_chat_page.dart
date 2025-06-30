import 'package:flutter/material.dart';

class GigChatPage extends StatelessWidget {
  final String eventName;
  final String hostAvatar;
  final bool useNetworkImages;

  const GigChatPage({
    super.key,
    required this.eventName,
    required this.hostAvatar,
    this.useNetworkImages = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B1F36),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B1F36),
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: useNetworkImages
                  ? NetworkImage(hostAvatar)
                  : AssetImage(hostAvatar) as ImageProvider,
            ),
            const SizedBox(width: 10),
            Text(
              eventName,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'JosefinSans',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Example chat bubbles
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    text: "Welcome to the group chat!",
                    isMe: false,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ChatBubble(
                    text: "Hi everyone 👋",
                    isMe: true,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    text: "Let's plan the gig details here.",
                    isMe: false,
                  ),
                ),
                // ...add more sample messages or connect to backend...
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.white24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Message...",
                      hintStyle: const TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: const Color(0xFF3A2F4D),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFF2B1F36)),
                    onPressed: () {
                      // TODO: Implement send logic
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatBubble({super.key, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isMe ? Colors.blueAccent : Colors.white24,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(18),
          topRight: const Radius.circular(18),
          bottomLeft: Radius.circular(isMe ? 18 : 0),
          bottomRight: Radius.circular(isMe ? 0 : 18),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isMe ? Colors.white : Colors.white70,
          fontFamily: 'JosefinSans',
        ),
      ),
    );
  }
}
