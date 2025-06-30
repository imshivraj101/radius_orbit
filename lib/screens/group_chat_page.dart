import 'package:flutter/material.dart';

class GroupChatPage extends StatefulWidget {
  final String groupName;
  const GroupChatPage({super.key, required this.groupName});

  @override
  State<GroupChatPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<_GroupMessage> _messages = [
    _GroupMessage(
      text: "Hey everyone! Ready for the meetup?",
      isMe: false,
      username: "Rohit",
    ),
    _GroupMessage(
      text: "Yes! Let's go!",
      isMe: true,
      username: "You",
    ),
    _GroupMessage(
      text: "Don't forget to bring snacks.",
      isMe: false,
      username: "Ashish",
    ),
  ];

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add(_GroupMessage(text: text, isMe: true, username: "You"));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B1F36),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: const Color(0xFF2B1F36),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          titleSpacing: 0,
          title: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.purple.shade200,
                child: Text(
                  widget.groupName[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'JosefinSans',
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                widget.groupName,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'JosefinSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.person_add_alt_1, color: Colors.white, size: 22),
              onPressed: () {
                // TODO: Implement add people logic
              },
              tooltip: "Add People",
            ),
            IconButton(
              icon: const Icon(Icons.call, color: Colors.white, size: 22),
              onPressed: () {
                // TODO: Implement call logic
              },
              tooltip: "Call",
            ),
            IconButton(
              icon: const Icon(Icons.info_outline, color: Colors.white, size: 22),
              onPressed: () {
                // TODO: Implement group info logic
              },
              tooltip: "Group Info",
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return Align(
                  alignment: msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: _GroupBubble(
                    text: msg.text,
                    isMe: msg.isMe,
                    username: msg.username,
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1, color: Colors.white24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3A2F4D),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(Icons.emoji_emotions_outlined, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Start Typing",
                      hintStyle: const TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: const Color(0xFF6C5A8B),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: _sendMessage,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B6FCB),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(Icons.send, color: Colors.white, size: 20),
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

class _GroupBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String username;

  const _GroupBubble({
    super.key,
    required this.text,
    required this.isMe,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isMe ? const Color(0xFF8B6FCB) : Colors.white24,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(16),
          topRight: const Radius.circular(16),
          bottomLeft: Radius.circular(isMe ? 16 : 0),
          bottomRight: Radius.circular(isMe ? 0 : 16),
        ),
      ),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            username,
            style: TextStyle(
              color: isMe ? Colors.white70 : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              fontFamily: 'JosefinSans',
            ),
          ),
          const SizedBox(height: 2),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'JosefinSans',
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _GroupMessage {
  final String text;
  final bool isMe;
  final String username;

  _GroupMessage({
    required this.text,
    required this.isMe,
    required this.username,
  });
}
