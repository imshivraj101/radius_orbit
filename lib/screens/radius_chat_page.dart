import 'package:flutter/material.dart';
import '../widgets/gig_chat_page.dart';
import 'group_chat_page.dart';
import 'mutuals_chat_page.dart';

class RadiusChatPage extends StatefulWidget {
  const RadiusChatPage({super.key});

  @override
  State<RadiusChatPage> createState() => _RadiusChatPageState();
}

class _RadiusChatPageState extends State<RadiusChatPage> {
  int selectedTab = 0;
  final List<String> tabs = ['Mutuals', 'Groups', 'Gigs'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF281F35),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Radius Chat Room",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'JosefinSans',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // TODO: Open chat settings or menu
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search Radius Chat",
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: const Color(0xFF32254A),
                contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Row(
              children: List.generate(tabs.length, (i) {
                final selected = selectedTab == i;
                return Padding(
                  padding: EdgeInsets.only(right: i < tabs.length - 1 ? 10 : 0),
                  child: GestureDetector(
                    onTap: () => setState(() => selectedTab = i),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(18),
                        border: selected ? null : Border.all(color: Colors.white, width: 1.2),
                      ),
                      child: Text(
                        tabs[i],
                        style: TextStyle(
                          color: selected ? const Color(0xFF281F35) : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'JosefinSans',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          // Section content
          Expanded(
            child: Builder(
              builder: (context) {
                if (selectedTab == 2) {
                  // Gigs section (special design)
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => GigChatPage(
                                eventName: "Housefull 5",
                                posterImage: 'assets/icons/trophy.jpeg',
                                hostAvatar: 'assets/icons/virat.jpg',
                                useNetworkImages: false,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      'assets/icons/trophy.jpeg',
                                      width: 59, // 50% of 118
                                      height: 78.5, // 50% of 157
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 4,
                                    left: 4,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text(
                                        "Mumbai",
                                        style: TextStyle(
                                          color: Color(0xFF281F35),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                          fontFamily: 'JosefinSans',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Housefull 5",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'JosefinSans',
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      "Movie Night",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontFamily: 'JosefinSans',
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      "2 Unread Messages",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'JosefinSans',
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "20:23",
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontFamily: 'JosefinSans',
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (selectedTab == 0) {
                  // Primary/Mutuals section (chat bubble style)
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MutualsChatPage(
                                username: "Ashish_Predator",
                                avatar: 'assets/icons/virat.jpg',
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 28,
                                backgroundImage: AssetImage('assets/icons/virat.jpg'),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Ashish_Predator",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'JosefinSans',
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      "Mai Kya bol raha.....",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontFamily: 'JosefinSans',
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "20:23",
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontFamily: 'JosefinSans',
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (selectedTab == 1) {
                  // Groups section (show some groups)
                  return ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    children: [
                      _GroupChatTile(
                        groupName: "Friend Group",
                        lastMessage: "Let's meet at 7pm!",
                        time: "19:10",
                        unread: 3,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const GroupChatPage(
                                groupName: "Friend Group",
                              ),
                            ),
                          );
                        },
                      ),
                      _GroupChatTile(
                        groupName: "Cricket Buddies",
                        lastMessage: "Match tomorrow?",
                        time: "18:45",
                        unread: 0,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const GroupChatPage(
                                groupName: "Cricket Buddies",
                              ),
                            ),
                          );
                        },
                      ),
                      _GroupChatTile(
                        groupName: "Anime Fans",
                        lastMessage: "New episode out!",
                        time: "17:30",
                        unread: 1,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const GroupChatPage(
                                groupName: "Anime Fans",
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                } else {
                  // Default case, should not happen
                  return Center(
                    child: Text(
                      "Select a tab to view content",
                      style: const TextStyle(
                        color: Colors.white54,
                        fontFamily: 'JosefinSans',
                        fontSize: 16,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _GroupChatTile extends StatelessWidget {
  final String groupName;
  final String lastMessage;
  final String time;
  final int unread;
  final VoidCallback onTap;

  const _GroupChatTile({
    required this.groupName,
    required this.lastMessage,
    required this.time,
    required this.unread,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.purple.shade200,
              child: Text(
                groupName[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JosefinSans',
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    groupName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'JosefinSans',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    lastMessage,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontFamily: 'JosefinSans',
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            if (unread > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "$unread",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(width: 8),
            Text(
              time,
              style: const TextStyle(
                color: Colors.white54,
                fontFamily: 'JosefinSans',
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
