import 'package:flutter/material.dart';
import 'circles_page.dart';
import '../widgets/post_card.dart';
import 'post_detail_page.dart'; // Import the PostDetailPage

class PostData {
  final String username;
  final String handle;
  final String location;
  final String userAvatar;
  final String postImage;
  final String caption;
  final String timeAgo;
  final String gig;
  final List<String> comments;
  final int likeCount;
  final int commentCount;

  PostData({
    required this.username,
    required this.handle,
    required this.location,
    required this.userAvatar,
    required this.postImage,
    required this.caption,
    required this.timeAgo,
    required this.gig,
    required this.comments,
    required this.likeCount,
    required this.commentCount,
  });
}

class CircleDetailsPage extends StatefulWidget {
  final CircleData circle;
  const CircleDetailsPage({super.key, required this.circle});

  @override
  State<CircleDetailsPage> createState() => _CircleDetailsPageState();
}

class _CircleDetailsPageState extends State<CircleDetailsPage> {
  int selectedTab = 0; // 0: Trending, 1: New, 2: Popular

  List<PostData> getPosts() {
    // Dummy post data for each tab
    if (selectedTab == 0) {
      // Trending
      return [
        PostData(
          username: 'Virat Kohli',
          handle: '@imvk18',
          location: 'India',
          userAvatar: 'assets/icons/virat.jpg',
          postImage: 'assets/icons/trophy.jpeg',
          caption: 'Now it\'s up to you to be strong!',
          timeAgo: '1h ago',
          gig: 'Cricket World Cup',
          comments: ['Great post!', 'Legend!', 'What a moment!'],
          likeCount: 120,
          commentCount: 3,
        ),
        PostData(
          username: 'AnimeFan',
          handle: '@animefan',
          location: 'Japan',
          userAvatar: 'assets/icons/anime.png',
          postImage: 'assets/icons/anime.png',
          caption: 'Trending anime this season!',
          timeAgo: '2h ago',
          gig: 'Anime Expo',
          comments: ['Which anime?', 'Looks cool!', 'Love this!'],
          likeCount: 98,
          commentCount: 3,
        ),
      ];
    } else if (selectedTab == 1) {
      // New
      return [
        PostData(
          username: 'Newbie',
          handle: '@newbie',
          location: 'USA',
          userAvatar: 'assets/icons/bell.svg',
          postImage: 'assets/icons/sports.png',
          caption: 'Just joined the circle!',
          timeAgo: '5m ago',
          gig: 'Welcome Event',
          comments: ['Welcome!', 'Glad to have you!'],
          likeCount: 10,
          commentCount: 2,
        ),
        PostData(
          username: 'FreshPost',
          handle: '@fresh',
          location: 'UK',
          userAvatar: 'assets/icons/message.svg',
          postImage: 'assets/icons/ticket.svg',
          caption: 'Excited to be here!',
          timeAgo: '10m ago',
          gig: 'First Gig',
          comments: ['Congrats!', 'Nice!'],
          likeCount: 7,
          commentCount: 2,
        ),
      ];
    } else {
      // Popular
      return [
        PostData(
          username: 'PopularGuy',
          handle: '@popguy',
          location: 'Australia',
          userAvatar: 'assets/icons/radius.png',
          postImage: 'assets/icons/sports.png',
          caption: 'This post is getting a lot of likes!',
          timeAgo: '3h ago',
          gig: 'Popular Event',
          comments: ['So true!', 'Awesome!', 'Keep it up!'],
          likeCount: 200,
          commentCount: 3,
        ),
        PostData(
          username: 'TopUser',
          handle: '@topuser',
          location: 'Canada',
          userAvatar: 'assets/icons/trophy.jpeg',
          postImage: 'assets/icons/trophy.jpeg',
          caption: 'Proud to be popular!',
          timeAgo: '4h ago',
          gig: 'Top Gig',
          comments: ['You rock!', 'Amazing!'],
          likeCount: 150,
          commentCount: 2,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final circle = widget.circle;
    return Scaffold(
      backgroundColor: const Color(0xFF281F35),
      appBar: AppBar(
        backgroundColor: const Color(0xFF281F35),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          circle.name,
          style: const TextStyle(color: Colors.white, fontFamily: 'JosefinSans'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: const Color(0xFF3A2F4D),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.exit_to_app, color: Colors.white),
                      title: const Text('Leave Circle', style: TextStyle(color: Colors.white)),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.report, color: Colors.white),
                      title: const Text('Report', style: TextStyle(color: Colors.white)),
                      onTap: () {},
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  circle.image,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    circle.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: circle.joined ? Colors.green : Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                      minimumSize: const Size(0, 22),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {},
                    child: Text(
                      circle.joined ? 'Joined' : 'Join',
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
                  // Total members styled like online members (icon + text, white)
                  Row(
                    children: [
                      const Icon(Icons.people, color: Colors.white, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        '${circle.radiants} Members',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'JosefinSans',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  // Online members styled like total members (colored badge)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: circle.color.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${circle.online} Online',
                      style: TextStyle(
                        color: circle.color,
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Tab buttons for Trending/New/Popular
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: SizedBox(
                height: 32,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedTab = 0),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selectedTab == 0 ? Colors.purple : const Color(0xFF3A2F4D),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Trending',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedTab = 1),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selectedTab == 1 ? Colors.blue : const Color(0xFF3A2F4D),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'New',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedTab = 2),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selectedTab == 2 ? Colors.orange : const Color(0xFF3A2F4D),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Popular',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Posts for selected tab
            ...getPosts().map((post) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: PostCard(
                username: post.username,
                handle: post.handle,
                location: post.location,
                userAvatar: post.userAvatar,
                postImage: post.postImage,
                caption: post.caption,
                timeAgo: post.timeAgo,
                likeCount: post.likeCount,
                commentCount: post.commentCount,
                showCounts: false,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostDetailPage(
                        username: post.username,
                        handle: post.handle,
                        location: post.location,
                        userAvatar: post.userAvatar,
                        postImage: post.postImage,
                        caption: post.caption,
                        timeAgo: post.timeAgo,
                        gig: post.gig,
                        comments: post.comments,
                        likeCount: post.likeCount,
                        commentCount: post.commentCount,
                      ),
                    ),
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
