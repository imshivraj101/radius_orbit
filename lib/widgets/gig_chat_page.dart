import 'package:flutter/material.dart';
import 'gig_group_details_page.dart';

class GigChatPage extends StatefulWidget {
  final String eventName;
  final String posterImage; // <-- Add this
  final String hostAvatar;
  final bool useNetworkImages;

  const GigChatPage({
    super.key,
    required this.eventName,
    required this.posterImage, // <-- Add this
    required this.hostAvatar,
    this.useNetworkImages = false,
  });

  @override
  State<GigChatPage> createState() => _GigChatPageState();
}

class _GigChatPageState extends State<GigChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<_ChatMessage> _messages = [
    _ChatMessage(
      text: "Welcome to the group chat!",
      isMe: false,
      avatar: null,
      username: "Virat",
    ),
    _ChatMessage(
      text: "Hi everyone 👋",
      isMe: true,
      avatar: null,
      username: null,
    ),
    _ChatMessage(
      text: "Let's plan the gig details here.",
      isMe: false,
      avatar: null,
      username: "Virat",
    ),
  ];

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add(_ChatMessage(text: text, isMe: true));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B1F36),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          backgroundColor: const Color(0xFF2B1F36),
          elevation: 0,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 8, left: 0, right: 0, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                // Use poster image for the gig
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: widget.useNetworkImages
                      ? Image.network(widget.posterImage, width: 36, height: 50, fit: BoxFit.cover)
                      : Image.asset(widget.posterImage, width: 36, height: 50, fit: BoxFit.cover),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.eventName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'JosefinSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "Mumbai",
                          style: TextStyle(
                            color: Color(0xFF2B1F36),
                            fontFamily: 'JosefinSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        "100 Members",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'JosefinSans',
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                // Add people and call icons
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
                // Details icon
                IconButton(
                  icon: const Icon(Icons.info_outline, color: Colors.white, size: 22),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GigGroupDetailsPage(
                          eventName: widget.eventName,
                          posterImage: widget.posterImage,
                          useNetworkImages: widget.useNetworkImages,
                        ),
                      ),
                    );
                  },
                  tooltip: "Group Details",
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return Align(
                  alignment: msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: _ChatBubble(
                    text: msg.text,
                    isMe: msg.isMe,
                    avatar: msg.isMe ? null : widget.hostAvatar,
                    useNetworkImages: widget.useNetworkImages,
                    username: msg.isMe ? null : msg.username ?? "Virat",
                  ),
                );
              },
            ),
          ),
          // Input bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: const BoxDecoration(
              color: Color(0xFF2B1F36),
              border: Border(
                top: BorderSide(color: Color(0xFF3A2F4D), width: 1),
              ),
            ),
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

class _ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String? avatar;
  final bool? useNetworkImages;
  final String? username;

  const _ChatBubble({
    super.key,
    required this.text,
    required this.isMe,
    this.avatar,
    this.useNetworkImages,
    this.username,
  });

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      // Right bubble (me)
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        constraints: const BoxConstraints(maxWidth: 220),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF8B6FCB),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'JosefinSans',
            fontSize: 14,
          ),
        ),
      );
    } else {
      // Left bubble (other user)
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (avatar != null)
            Padding(
              padding: const EdgeInsets.only(right: 6, top: 6),
              child: CircleAvatar(
                radius: 14,
                backgroundImage: (useNetworkImages ?? false)
                    ? NetworkImage(avatar!)
                    : AssetImage(avatar!) as ImageProvider,
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 2),
                constraints: const BoxConstraints(maxWidth: 220),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFF2B1F36),
                    fontFamily: 'JosefinSans',
                    fontSize: 14,
                  ),
                ),
              ),
              if (username != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 2),
                  child: Text(
                    username!,
                    style: const TextStyle(
                      color: Colors.white, // Changed from black to white
                      fontFamily: 'JosefinSans',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ],
      );
    }
  }
}

class _ChatMessage {
  final String text;
  final bool isMe;
  final String? avatar;
  final String? username;

  _ChatMessage({
    required this.text,
    required this.isMe,
    this.avatar,
    this.username,
  });
}
