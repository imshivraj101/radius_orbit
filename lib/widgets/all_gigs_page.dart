import 'package:flutter/material.dart';
import '../widgets/gig_card.dart';

class AllGigsPage extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> gigs;

  const AllGigsPage({super.key, required this.title, required this.gigs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B1F36),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B1F36),
        title: Text(title, style: const TextStyle(fontFamily: 'JosefinSans')),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: gigs.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            final gig = gigs[index];
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
      ),
    );
  }
}
