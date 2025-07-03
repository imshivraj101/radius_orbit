import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final String username;
  final String handle;
  final String location;
  final String userAvatar;
  final String postImage;
  final String caption;
  final String timeAgo;
  final int likeCount;
  final int commentCount;
  final VoidCallback? onTap;
  final bool showCounts;

  const PostCard({
    super.key,
    required this.username,
    required this.handle,
    required this.location,
    required this.userAvatar,
    required this.postImage,
    required this.caption,
    required this.timeAgo,
    required this.likeCount,
    required this.commentCount,
    this.onTap,
    this.showCounts = true,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool liked = false;
  bool heartbroken = false;
  void _showCommentSheet(BuildContext context) {
    final controller = TextEditingController();
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF32264A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Add a comment...',
                hintStyle: TextStyle(color: Colors.white54),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }

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
                      widget.username,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.handle,
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
            GestureDetector(
              onTap: widget.onTap,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  bottomLeft: Radius.circular(32),
                ),
                child: Image.asset(
                  widget.postImage,
                  width: screenWidth,
                  height: 300,
                  fit: BoxFit.cover,
                ),
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
                  backgroundImage: AssetImage(widget.userAvatar),
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
                    widget.location,
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    liked = !liked;
                    if (liked) heartbroken = false;
                  });
                },
                child: Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                  color: liked ? Colors.pinkAccent : Colors.white,
                ),
              ),
              if (widget.showCounts) ...[
                const SizedBox(width: 4),
                Text('${widget.likeCount}', style: const TextStyle(color: Colors.white, fontSize: 13)),
              ],
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  setState(() {
                    heartbroken = !heartbroken;
                    if (heartbroken) liked = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    // No circle, just a border for the icon shape
                  ),
                  padding: const EdgeInsets.all(0),
                  child: Icon(
                    heartbroken ? Icons.heart_broken : Icons.heart_broken_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              if (widget.showCounts) ...[
                const SizedBox(width: 4),
                Text('0', style: TextStyle(color: Colors.white, fontSize: 13)), // Placeholder for heartbreak count
              ],
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => _showCommentSheet(context),
                child: const Icon(Icons.forum_outlined, color: Colors.white),
              ),
              if (widget.showCounts) ...[
                const SizedBox(width: 4),
                Text('${widget.commentCount}', style: const TextStyle(color: Colors.white, fontSize: 13)),
              ],
              const SizedBox(width: 32), // More left padding for send button
              Transform.translate(
                offset: const Offset(-9, -2),
                child: Transform.rotate(
                  angle: -0.785398,
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
            widget.caption,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),

        const SizedBox(height: 8),

        // ── Time Ago ──
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.timeAgo,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}
