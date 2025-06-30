import 'package:flutter/material.dart';
import '../models/gig_visibility.dart';
import '../widgets/gig_card.dart';
import '../widgets/all_gigs_page.dart'; // Make sure you have this file created

class GigPage extends StatelessWidget {
  final VoidCallback? onLeftSwipe;

  const GigPage({super.key, this.onLeftSwipe});

  final List<Map<String, dynamic>> upcomingGigs = const [
    {
      'posterImage': 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80',
      'hostAvatar': 'https://randomuser.me/api/portraits/men/32.jpg',
      'eventDate': '11th March',
      'eventName': 'Housefull 5 Movie Night',
      'visibility': GigVisibility.private,
      'location': 'Mumbai',
      'seatsLeft': 30,
    },
    {
      'posterImage': 'https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=400&q=80',
      'hostAvatar': 'https://randomuser.me/api/portraits/women/44.jpg',
      'eventDate': '12th March',
      'eventName': 'Open Mic Standup',
      'visibility': GigVisibility.public,
      'location': 'Delhi',
      'seatsLeft': 12,
    },
    {
      'posterImage': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?auto=format&fit=crop&w=400&q=80',
      'hostAvatar': 'https://randomuser.me/api/portraits/men/65.jpg',
      'eventDate': '15th March',
      'eventName': 'Footballers Union',
      'visibility': GigVisibility.unlisted,
      'location': 'Online',
      'seatsLeft': 5,
    },
    {
      'posterImage': 'https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=400&q=80',
      'hostAvatar': 'https://randomuser.me/api/portraits/women/68.jpg',
      'eventDate': '18th March',
      'eventName': 'Bollywood Night',
      'visibility': GigVisibility.public,
      'location': 'Pune',
      'seatsLeft': 20,
    },
  ];

  final List<Map<String, dynamic>> friendGigs = const [
    {
      'posterImage': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?auto=format&fit=crop&w=400&q=80',
      'hostAvatar': 'https://randomuser.me/api/portraits/men/65.jpg',
      'eventDate': '15th March',
      'eventName': 'Gaming LAN Night',
      'visibility': GigVisibility.unlisted,
      'location': 'Online',
      'seatsLeft': 5,
    },
    {
      'posterImage': 'https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=400&q=80',
      'hostAvatar': 'https://randomuser.me/api/portraits/women/68.jpg',
      'eventDate': '18th March',
      'eventName': 'Bollywood Night',
      'visibility': GigVisibility.public,
      'location': 'Pune',
      'seatsLeft': 20,
    },
    {
      'posterImage': 'https://images.unsplash.com/photo-1581320545988-d0c21c8f6447?auto=format&fit=crop&w=400&q=80',
      'hostAvatar': 'https://randomuser.me/api/portraits/men/88.jpg',
      'eventDate': '20th March',
      'eventName': 'Sketch & Chill',
      'visibility': GigVisibility.public,
      'location': 'Delhi',
      'seatsLeft': 12,
    },
    {
      'posterImage': 'https://images.unsplash.com/photo-1606788075764-4c8d94ee2b57?auto=format&fit=crop&w=400&q=80',
      'hostAvatar': 'https://randomuser.me/api/portraits/men/29.jpg',
      'eventDate': '22nd March',
      'eventName': 'Comedy Roast',
      'visibility': GigVisibility.private,
      'location': 'Online',
      'seatsLeft': 15,
    },
  ];

  final List<Map<String, dynamic>> nearbyGigs = const [
    {
      'posterImage': 'https://images.unsplash.com/photo-1606788075764-4c8d94ee2b57?auto=format&fit=crop&w=400&q=80',
      'hostAvatar': 'https://randomuser.me/api/portraits/men/29.jpg',
      'eventDate': '20th March',
      'eventName': 'Indie Music Bash',
      'visibility': GigVisibility.private,
      'location': 'Nashik',
      'seatsLeft': 8,
    },
    {
      'posterImage': 'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?auto=format&fit=crop&w=400&q=80',
      'hostAvatar': 'https://randomuser.me/api/portraits/women/59.jpg',
      'eventDate': '22nd March',
      'eventName': 'Tech Meetup 2025',
      'visibility': GigVisibility.public,
      'location': 'Online',
      'seatsLeft': 50,
    },
    {
      'posterImage': 'https://images.unsplash.com/photo-1509305717900-2f10b66b8ef4?auto=format&fit=crop&w=400&q=80',
      'hostAvatar': 'https://randomuser.me/api/portraits/men/43.jpg',
      'eventDate': '23rd March',
      'eventName': 'Short Film Showcase',
      'visibility': GigVisibility.public,
      'location': 'Ahmednagar',
      'seatsLeft': 10,
    },
    {
      'posterImage': 'https://images.unsplash.com/photo-1600255822947-44b7d0e0adf0?auto=format&fit=crop&w=400&q=80',
      'hostAvatar': 'https://randomuser.me/api/portraits/women/90.jpg',
      'eventDate': '25th March',
      'eventName': 'Book Swap Meetup',
      'visibility': GigVisibility.unlisted,
      'location': 'Pune',
      'seatsLeft': 6,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null && details.primaryVelocity! > 0) {
          onLeftSwipe?.call();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2B1F36),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: ListView(
          children: [
            _searchBar(),
            _gigSection(context, 'Upcoming gigs', upcomingGigs),
            _gigSection(context, 'Your friends are going to', friendGigs),
            _gigSection(context, 'Near you', nearbyGigs),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 18),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF23192B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: const [
          Icon(Icons.search, color: Colors.white, size: 22),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Find a gig that kicks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'JosefinSans',
              ),
            ),
          ),
          Icon(Icons.filter_alt_outlined, color: Colors.white, size: 22),
        ],
      ),
    );
  }

  Widget _gigSection(BuildContext context, String title, List<Map<String, dynamic>> gigs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14, top: 18, bottom: 8, right: 8),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JosefinSans',
                ),
              ),
              const SizedBox(width: 6),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 18),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AllGigsPage(title: title, gigs: gigs),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: gigs.length > 4 ? 4 : gigs.length,
          padding: const EdgeInsets.symmetric(horizontal: 2),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, i) {
            final gig = gigs[i];
            return GigCard(
              posterImage: gig['posterImage'],
              hostAvatar: gig['hostAvatar'],
              eventDate: gig['eventDate'],
              eventName: gig['eventName'],
              visibility: gig['visibility'],
              location: gig['location'],
              seatsLeft: gig['seatsLeft'],
              useNetworkImages: true,
            );
          },
        ),
      ],
    );
  }
}
