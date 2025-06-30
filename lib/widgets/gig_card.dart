import 'package:flutter/material.dart';
import '../models/gig_visibility.dart'; // Ensure this is imported from a single source
import 'gig_detail_page.dart';

class GigCard extends StatelessWidget {
  final String posterImage;
  final String hostAvatar;
  final String eventDate;
  final String eventName;
  final GigVisibility visibility;
  final String location;
  final int seatsLeft;
  final bool useNetworkImages;

  const GigCard({
    super.key,
    required this.posterImage,
    required this.hostAvatar,
    required this.eventDate,
    required this.eventName,
    required this.visibility,
    required this.location,
    required this.seatsLeft,
    this.useNetworkImages = false,
  });

  IconData get _visibilityIcon {
    switch (visibility) {
      case GigVisibility.public:
        return Icons.lock_open_rounded;
      case GigVisibility.unlisted:
        return Icons.link_rounded;
      case GigVisibility.private:
      default:
        return Icons.lock_rounded;
    }
  }

  Color get _locationColor {
    if (location.toLowerCase().contains('online')) {
      return Colors.greenAccent.shade400;
    }
    return Colors.redAccent.shade200;
  }

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 150;
    const double posterW = 118;
    const double posterH = 157;

    return Container(
      width: cardWidth,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF2B1F36),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // 🎞 Poster Image with drop shadow
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GigDetailPage(
                        posterImage: posterImage,
                        hostAvatar: hostAvatar,
                        eventDate: eventDate,
                        eventName: eventName,
                        visibility: visibility,
                        location: location,
                        seatsLeft: seatsLeft,
                        useNetworkImages: useNetworkImages,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: posterW,
                  height: posterH,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.18),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                    child: useNetworkImages
                        ? Image.network(posterImage, width: posterW, height: posterH, fit: BoxFit.cover)
                        : Image.asset(posterImage, width: posterW, height: posterH, fit: BoxFit.cover),
                  ),
                ),
              ),

              // 📅 Event Date
              Positioned(
                bottom: -22,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 118,
                    height: 22,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.07),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      eventDate,
                      style: const TextStyle(
                        color: Color(0xFF2B1F36),
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        fontFamily: 'JosefinSans',
                      ),
                    ),
                  ),
                ),
              ),

              // 🧑 Host Avatar (TOPMOST)
              Positioned(
                left: -15,
                bottom: -18,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundImage: useNetworkImages
                        ? NetworkImage(hostAvatar)
                        : AssetImage(hostAvatar) as ImageProvider,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),

          // 📛 Event Name & Visibility Icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    eventName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      fontFamily: 'JosefinSans',
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Show icon based on visibility
                if (visibility == GigVisibility.private)
                  const Icon(Icons.lock_rounded, color: Colors.white, size: 18),
                if (visibility == GigVisibility.public)
                  const Icon(Icons.remove_red_eye_rounded, color: Colors.white, size: 18),
                if (visibility == GigVisibility.unlisted)
                  const Icon(Icons.link_rounded, color: Colors.white, size: 18),
              ],
            ),
          ),

        // 📍 Location
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
  child: Text(
    location,
    style: TextStyle(
      color: location.toLowerCase().contains('online')
          ? Colors.greenAccent.shade400
          : Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 12.5,
      fontFamily: 'JosefinSans',
    ),
  ),
),


          // 🎟 Seats Left
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: Text(
              '$seatsLeft Seat${seatsLeft == 1 ? '' : 's'} Left',
              style: const TextStyle(
                color: Colors.red,
                fontSize: 11.5,
                fontWeight: FontWeight.w500,
                fontFamily: 'JosefinSans',
              ),
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
