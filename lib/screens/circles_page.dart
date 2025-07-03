import 'package:flutter/material.dart';
import 'circle_details_page.dart';

class CircleData {
  final String name;
  final String image;
  final int online;
  final String radiants;
  final bool joined;
  final Color color;

  CircleData({
    required this.name,
    required this.image,
    required this.online,
    required this.radiants,
    required this.joined,
    required this.color,
  });
}

class CirclesPage extends StatelessWidget {
  const CirclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CircleData> circles = [
      CircleData(
        name: 'Anime',
        image: 'assets/icons/anime.png',
        online: 100,
        radiants: '100k radiants',
        joined: false,
        color: Colors.red,
      ),
      CircleData(
        name: 'Sports',
        image: 'assets/icons/sports.png',
        online: 80,
        radiants: '80k radiants',
        joined: true,
        color: Colors.green,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF281F35),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3A2F4D),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Icon(Icons.search, color: Colors.white, size: 22),
                          ),
                          const Expanded(
                            child: Text(
                              'Search People or Circles',
                              style: TextStyle(color: Colors.white70, fontSize: 16, fontFamily: 'JosefinSans'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3A2F4D),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.filter_alt, color: Colors.white, size: 24),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: circles.length,
                separatorBuilder: (_, __) => const SizedBox(height: 18),
                itemBuilder: (context, i) {
                  return CircleCard(circle: circles[i]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleCard extends StatelessWidget {
  final CircleData circle;
  const CircleCard({super.key, required this.circle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CircleDetailsPage(circle: circle),
          ),
        );
      },
      child: Center(
        child: SizedBox(
          width: 360,
          height: 250,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.04),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: circle.color.withOpacity(0.7),
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    circle.image,
                    height: 170,
                    width: 360,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 2, 9, 2),
                  child: SizedBox(
                    height: 22,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            circle.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.circle, color: circle.color, size: 12),
                            const SizedBox(width: 4),
                            Text(
                              '${circle.online} Online',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'JosefinSans',
                                fontSize: 10,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          height: 22,
                          child: ElevatedButton(
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
                                fontSize: 10,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 6, 16, 10), // adjusted padding to prevent overflow
                  child: SizedBox(
                    height: 26,
                    child: Container(
                      width: 126,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0), // slightly reduced horizontal padding
                      decoration: BoxDecoration(
                        color: circle.color.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          (() {
                            final match = RegExp(r'(\d+)([kM]?)').firstMatch(circle.radiants);
                            if (match != null) {
                              double value = double.parse(match.group(1)!);
                              String suffix = match.group(2) ?? '';
                              value = (value * 0.6);
                              String display = value.round().toString();
                              return '$display$suffix radiants';
                            }
                            return circle.radiants;
                          })(),
                          style: TextStyle(
                            color: circle.color,
                            fontFamily: 'JosefinSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
