import 'package:flutter/material.dart';
import '../widgets/post_card.dart';
import 'settings_page.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  final String avatar;
  final bool showBackArrow;
  const ProfilePage({super.key, required this.username, required this.avatar, this.showBackArrow = false});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedTab = 0;

  final List<Map<String, String>> orbitPosts = [
    {
      'username': 'Virat Kohli',
      'handle': '@imvk18',
      'location': 'Chinaswamy',
      'userAvatar': 'assets/icons/virat.jpg',
      'postImage': 'assets/icons/virat.jpg',
      'caption': 'For those who dominate every circle they step into.',
      'timeAgo': '1h ago',
    },
  ];

  final List<Map<String, String>> sportsPosts = [
    {
      'username': 'Virat Kohli',
      'handle': '@imvk18',
      'location': 'Wankhede',
      'userAvatar': 'assets/icons/virat.jpg',
      'postImage': 'assets/icons/trophy.jpeg',
      'caption': 'Another day, another win!',
      'timeAgo': '2h ago',
    },
  ];

  final List<Map<String, String>> animePosts = [
    {
      'username': 'Virat Kohli',
      'handle': '@imvk18',
      'location': 'AnimeCon',
      'userAvatar': 'assets/icons/virat.jpg',
      'postImage': 'assets/icons/virat.jpg',
      'caption': 'Anime vibes only!',
      'timeAgo': '3h ago',
    },
  ];

  List<Map<String, String>> get currentPosts {
    if (selectedTab == 0) return orbitPosts;
    if (selectedTab == 1) return sportsPosts;
    return animePosts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF281F35),
      appBar: widget.showBackArrow
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            )
          : null,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // Top section with avatar and menu
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
                    child: Row(
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 45),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                            child: CircleAvatar(
                              radius: 44,
                              backgroundImage: AssetImage(widget.avatar),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SettingsPage(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Name, handle, location
                  Text(
                    widget.username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'JosefinSans',
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '@imvk18',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontFamily: 'JosefinSans',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.location_on, color: Colors.white70, size: 16),
                      SizedBox(width: 4),
                      Text(
                        'Chinaswamy',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontFamily: 'JosefinSans',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Crush and Follow buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                        ),
                        child: const Text(
                          'Crush',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'JosefinSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                        ),
                        child: const Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'JosefinSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),

                  // Stats
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF281F35), // Match background
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        _ProfileStat(label: 'Posts', value: '45'),
                        _ProfileStat(label: 'Followers', value: '11m'),
                        _ProfileStat(label: 'Aura', value: '1000m'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Bio
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      'For those who dominate every circle they step into.\nFrom gully cricket to global greatness.\nRead more...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'JosefinSans',
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Tabs
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start, // Left align
                      children: [
                        _ProfileTab(
                          label: 'Orbit',
                          selected: selectedTab == 0,
                          onTap: () => setState(() => selectedTab = 0),
                        ),
                        const SizedBox(width: 10), // Minimal space
                        _ProfileTab(
                          label: 'Sports',
                          selected: selectedTab == 1,
                          onTap: () => setState(() => selectedTab = 1),
                        ),
                        const SizedBox(width: 10), // Minimal space
                        _ProfileTab(
                          label: 'Anime',
                          selected: selectedTab == 2,
                          onTap: () => setState(() => selectedTab = 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Post Cards (full width image)
                  ...currentPosts.map((post) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
                    child: PostCard(
                      username: post['username']!,
                      handle: post['handle']!,
                      location: post['location']!,
                      userAvatar: post['userAvatar']!,
                      postImage: post['postImage']!,
                      caption: post['caption']!,
                      timeAgo: post['timeAgo']!,
                    ),
                  )),
                  const SizedBox(height: 80),
                ],
              ),
            ),
            // Bottom Navbar always visible
            // Positioned(
            //   left: 20,r
            //   right: 20,
            //   bottom: 24,
            //   child: CustomBottomNavBar(
            //     currentIndex: 2,
            //     onTap: (index) {
            //       Navigator.of(context).popUntil((route) => route.isFirst);
            //     },
            //     highlightHome: false,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String label;
  final String value;
  const _ProfileStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
            fontFamily: 'JosefinSans',
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
            fontFamily: 'JosefinSans',
          ),
        ),
      ],
    );
  }
}

class _ProfileTab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  const _ProfileTab({required this.label, this.selected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6), // Reduced button height
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          border: selected ? null : Border.all(color: Colors.white, width: 1.2),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? const Color(0xFF281F35) : Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'JosefinSans',
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
