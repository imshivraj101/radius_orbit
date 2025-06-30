import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'type': 'like',
        'user': 'Rohit',
        'avatar': 'assets/icons/virat.jpg',
        'desc': 'liked your post',
        'time': '2m ago',
        'color': Colors.pinkAccent,
        'icon': Icons.favorite,
      },
      {
        'type': 'comment',
        'user': 'Anushka',
        'avatar': 'assets/icons/virat.jpg',
        'desc': 'commented: "Epic shot!"',
        'time': '5m ago',
        'color': Colors.blueAccent,
        'icon': Icons.comment,
      },
      {
        'type': 'tag',
        'user': 'Hardik',
        'avatar': 'assets/icons/virat.jpg',
        'desc': 'tagged you in a post',
        'time': '10m ago',
        'color': Colors.orangeAccent,
        'icon': Icons.alternate_email,
      },
      {
        'type': 'invite',
        'user': 'Mumbai Gigs',
        'avatar': 'assets/icons/trophy.jpeg',
        'desc': 'invited you to a gig',
        'time': '20m ago',
        'color': Colors.greenAccent,
        'icon': Icons.event,
      },
      {
        'type': 'aura',
        'user': 'System',
        'avatar': '',
        'desc': 'You earned +50 Aura++',
        'time': '30m ago',
        'color': Colors.amber,
        'icon': Icons.bolt_rounded,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF281F35),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'JosefinSans',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          final n = notifications[i];
          return Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: (n['type'] == 'aura') ? Colors.amber : (n['color'] as Color).withOpacity(0.5),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: (n['color'] as Color).withOpacity(0.10),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                if ((n['avatar'] as String).isNotEmpty)
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(n['avatar'] as String),
                  )
                else
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (n['color'] as Color).withOpacity(0.18),
                    ),
                    child: Icon(n['icon'] as IconData, color: n['color'] as Color, size: 28),
                  ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (n['type'] != 'aura')
                        Row(
                          children: [
                            Text(
                              n['user'] as String,
                              style: TextStyle(
                                color: n['color'] as Color,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'JosefinSans',
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                n['desc'] as String,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'JosefinSans',
                                  fontSize: 15,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      if (n['type'] == 'aura')
                        Row(
                          children: [
                            const Icon(Icons.bolt_rounded, color: Colors.amber, size: 20),
                            const SizedBox(width: 6),
                            Text(
                              n['desc'] as String,
                              style: const TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'JosefinSans',
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 2),
                      Text(
                        n['time'] as String,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontFamily: 'JosefinSans',
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: (n['color'] as Color).withOpacity(0.13),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(n['icon'] as IconData, color: n['color'] as Color, size: 22),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
