import 'package:flutter/material.dart';
import '../widgets/post_card.dart';
import '../widgets/top_bar.dart';
import '../widgets/bottom_nav.dart';

class Orbit extends StatelessWidget {
  const Orbit({super.key});

  @override
  Widget build(BuildContext context) {
    final post = {
      'username': 'Virat Kohli',
      'handle': '@imvk18',
      'location': 'Mumbai, India',
      'userAvatar': 'assets/icons/virat.jpg',
      'postImage': 'assets/icons/trophy.jpeg',
      'caption': 'Me & My Better Half ❤️🏆',
      'timeAgo': '1h ago',
    };

    return Scaffold(
      extendBody: true,                        // allow body under navbar
      backgroundColor: const Color(0xFF281F35),
      body: SafeArea(
        child: Stack(
          children: [
            // ── Main content: TopBar + List ──
            Column(
              children: [
                const TopBar(),
                const SizedBox(height: 4),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 8, bottom: 100),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return PostCard(
                        username: post['username']!,
                        handle: post['handle']!,
                        location: post['location']!,
                        userAvatar: post['userAvatar']!,
                        postImage: post['postImage']!,
                        caption: post['caption']!,
                        timeAgo: '${index + 1}h ago',
                      );
                    },
                  ),
                ),
              ],
            ),

            // ── Floating Navbar ──
            Positioned(
              left: 20,
              right: 20,
              bottom: 24,
              child: const CustomBottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }
}
