import 'package:flutter/material.dart';

class PostDetailPage extends StatefulWidget {
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

  const PostDetailPage({
    super.key,
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

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late List<List<String>> replies;
  late List<TextEditingController> replyControllers;
  bool isFollowing = false;
  bool liked = false;
  bool heartbroken = false;
  final int heartbreakCount = 12; // Dummy value for heartbreaks
  bool _showBigLike = false;

  @override
  void initState() {
    super.initState();
    replies = List.generate(widget.comments.length, (_) => []);
    replyControllers = List.generate(widget.comments.length, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var c in replyControllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _showLikeAnimation() {
    setState(() {
      _showBigLike = true;
    });
    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) {
        setState(() {
          _showBigLike = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF281F35),
      appBar: AppBar(
        backgroundColor: const Color(0xFF281F35),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Post Details', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: const Color(0xFF281F35), // match background
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(widget.userAvatar),
                        radius: 28,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.username, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                            Text(widget.handle, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                            Row(
                              children: [
                                const Icon(Icons.location_on, size: 16, color: Colors.white70),
                                const SizedBox(width: 4),
                                Text(widget.location, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isFollowing ? Colors.green : Colors.white,
                          foregroundColor: isFollowing ? Colors.white : Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                          minimumSize: const Size(0, 32),
                        ),
                        onPressed: () {
                          setState(() {
                            isFollowing = !isFollowing;
                          });
                        },
                        child: Text(isFollowing ? 'Following' : 'Follow', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      liked = true;
                      heartbroken = false;
                    });
                    _showLikeAnimation();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        widget.postImage,
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                      if (_showBigLike)
                        AnimatedOpacity(
                          opacity: _showBigLike ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 400),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white.withOpacity(0.85),
                            size: 120,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                color: const Color(0xFF281F35), // match background
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.caption, style: const TextStyle(color: Colors.white, fontSize: 16)),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.access_time, color: Colors.white54, size: 16),
                          const SizedBox(width: 4),
                          Text(widget.timeAgo, style: const TextStyle(color: Colors.white54, fontSize: 13)),
                          const Spacer(),
                          const Icon(Icons.music_note, color: Colors.white54, size: 16),
                          const SizedBox(width: 4),
                          Text(widget.gig, style: const TextStyle(color: Colors.white54, fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Like and comment count row (Instagram style)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
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
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text('${widget.likeCount}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          heartbroken = !heartbroken;
                          if (heartbroken) liked = false;
                        });
                      },
                      child: Icon(
                        heartbroken ? Icons.heart_broken : Icons.heart_broken_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text('$heartbreakCount', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
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
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.purple,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Send', style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: const Icon(Icons.mode_comment_outlined, color: Colors.white70, size: 20),
                    ),
                    const Spacer(),
                    const Icon(Icons.bookmark_border, color: Colors.white),
                  ],
                ),
              ),
              // Comments section (Instagram style)
              Text('Comments', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              ...List.generate(widget.comments.length, (i) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(radius: 16, backgroundColor: Colors.white24, child: Icon(Icons.person, color: Colors.white, size: 18)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(widget.username, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                              const SizedBox(width: 8),
                              Text(widget.timeAgo, style: const TextStyle(color: Colors.white38, fontSize: 12)),
                            ],
                          ),
                          Text(widget.comments[i], style: const TextStyle(color: Colors.white70, fontSize: 14)),
                          if (replies[i].isNotEmpty) ...[
                            const SizedBox(height: 4),
                            ...replies[i].map((r) => Padding(
                              padding: const EdgeInsets.only(left: 12, bottom: 2),
                              child: Row(
                                children: [
                                  const Icon(Icons.subdirectory_arrow_right, color: Colors.white24, size: 16),
                                  const SizedBox(width: 4),
                                  Text(r, style: const TextStyle(color: Colors.white60, fontSize: 13)),
                                ],
                              ),
                            )),
                          ],
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
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
                                            controller: replyControllers[i],
                                            style: const TextStyle(color: Colors.white),
                                            decoration: const InputDecoration(
                                              hintText: 'Reply...',
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
                                              setState(() {
                                                if (replyControllers[i].text.trim().isNotEmpty) {
                                                  replies[i].add(replyControllers[i].text.trim());
                                                  replyControllers[i].clear();
                                                }
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Reply'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                child: const Text('Reply', style: TextStyle(color: Colors.blueAccent, fontSize: 13)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
