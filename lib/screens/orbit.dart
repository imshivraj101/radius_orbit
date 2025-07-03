import 'package:flutter/material.dart';
import '../widgets/post_card.dart';
import '../widgets/top_bar.dart';
import '../widgets/bottom_nav.dart';
import 'gig_page.dart'; // renamed import
import 'profile_page.dart'; // <-- Add this import
import 'circles_page.dart';
import 'create_post_page.dart';
import 'post_detail_page.dart'; // <-- Import PostDetailPage

class Orbit extends StatefulWidget {
  const Orbit({super.key});

  @override
  State<Orbit> createState() => _OrbitState();
}

class _OrbitState extends State<Orbit> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onNavTap(int index) {
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

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
      extendBody: true,
      backgroundColor: const Color(0xFF281F35),
      body: SafeArea(
        child: Stack(
          children: [
            // Use PageView for swipe navigation
            PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              children: [
                // 0: Create Post (leftmost)
                const CreatePostPage(),
                // 1: Circles page (now second)
                const CirclesPage(),
                // 2: Home (Orbit)
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
                            likeCount: 100 + index,
                            commentCount: 10 + index,
                            showCounts: false,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PostDetailPage(
                                    username: post['username']!,
                                    handle: post['handle']!,
                                    location: post['location']!,
                                    userAvatar: post['userAvatar']!,
                                    postImage: post['postImage']!,
                                    caption: post['caption']!,
                                    timeAgo: '${index + 1}h ago',
                                    gig: 'Sample Gig',
                                    comments: ['Nice!', 'Awesome!', 'Great!'],
                                    likeCount: 100 + index,
                                    commentCount: 10 + index,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                // 3: Gig page
                GigPage(
                  onLeftSwipe: () => _onNavTap(2),
                ),
                // 4: Profile page
                ProfilePage(
                  username: 'Virat Kohli',
                  avatar: 'assets/icons/virat.jpg',
                ),
              ],
            ),
            // Floating Navbar
            Positioned(
              left: 20,
              right: 20,
              bottom: 24,
              child: CustomBottomNavBar(
                currentIndex: _currentPage,
                onTap: (index) {
                  _onNavTap(index);
                },
                highlightHome: _currentPage == 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
