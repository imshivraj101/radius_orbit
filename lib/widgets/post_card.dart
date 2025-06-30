import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String username;
  final String handle;
  final String location;
  final String userAvatar;
  final String postImage;
  final String caption;
  final String timeAgo;

  const PostCard({
    super.key,
    required this.username,
    required this.handle,
    required this.location,
    required this.userAvatar,
    required this.postImage,
    required this.caption,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header (Name + Follow) ──
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 64),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      handle,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'follow',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ),

        // ── Post Image with Location and PFP ──
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                bottomLeft: Radius.circular(32),
              ),
              child: Image.asset(
                postImage,
                width: screenWidth,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            // Profile picture with white stroke
            Positioned(
              top: -45,
              left: 16,
              child: Container(
                padding: const EdgeInsets.all(0.5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(userAvatar),
                ),
              ),
            ),
            // Location text
            Positioned(
              top: 15,
              left: 20,
              child: Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    location,
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // ── Actions ──
        Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: Row(
    children: [
      const Icon(Icons.favorite_border, color: Colors.white),
      const SizedBox(width: 16),
      const Icon(Icons.heart_broken_outlined, color: Colors.white),
      const SizedBox(width: 16),
      const Icon( Icons.forum_outlined,color: Colors.white),
      const SizedBox(width: 16),

      
      const SizedBox(width: 16),
    Transform.translate(
  offset: const Offset(-9, -2), // move up by 2 pixels
  child: Transform.rotate(
    angle: -0.785398, // 45 degrees (northeast)
    child: const Icon(Icons.send_outlined, color: Colors.white),
  ),
),

      const Spacer(),
      const Icon(Icons.bookmark_border, color: Colors.white),
    ],
  ),
),


        const SizedBox(height: 12),

        // ── Caption ──
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            caption,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),

        const SizedBox(height: 8),

        // ── Time Ago ──
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            timeAgo,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}
