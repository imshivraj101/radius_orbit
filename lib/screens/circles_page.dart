import 'package:flutter/material.dart';

class CirclesPage extends StatelessWidget {
  const CirclesPage({super.key});

  // This page should be at index 3 in the main navigation (bottom nav/PageView)
  static const int pageIndex = 3;

  @override
  Widget build(BuildContext context) {
    final circles = [
      {'name': 'Cricket Circle', 'members': 12, 'icon': Icons.sports_cricket},
      {'name': 'Anime Circle', 'members': 8, 'icon': Icons.movie},
      {'name': 'Music Circle', 'members': 15, 'icon': Icons.music_note},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF281F35),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Circles",
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
        itemCount: circles.length,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (context, i) {
          final c = circles[i];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.purpleAccent.withOpacity(0.5),
                width: 1.2,
              ),
            ),
            child: Row(
              children: [
                Icon(c['icon'] as IconData, color: Colors.purpleAccent, size: 32),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    c['name'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "${c['members']} members",
                    style: const TextStyle(
                      color: Colors.purpleAccent,
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
