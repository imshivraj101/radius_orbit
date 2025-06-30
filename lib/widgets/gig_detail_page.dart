import 'package:flutter/material.dart';
import '../models/gig_visibility.dart';
import 'gig_chat_page.dart';

class GigDetailPage extends StatelessWidget {
  final String posterImage;
  final String hostAvatar;
  final String eventDate;
  final String eventName;
  final GigVisibility visibility;
  final String location;
  final int seatsLeft;
  final bool useNetworkImages;

  const GigDetailPage({
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B1F36),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.18),
                              blurRadius: 18,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: useNetworkImages
                              ? Image.network(posterImage, width: 118, height: 157, fit: BoxFit.cover)
                              : Image.asset(posterImage, width: 118, height: 157, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        "$seatsLeft/230 seats left",
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'JosefinSans',
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Event Date and Name
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.calendar_today, color: Colors.white54, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          eventDate,
                          style: const TextStyle(
                            color: Colors.white54,
                            fontFamily: 'JosefinSans',
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      eventName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'JosefinSans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 18),
                    // Description
                    const Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.white54,
                        fontFamily: 'JosefinSans',
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "This is a sample description for the gig. Add your gig details here.",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'JosefinSans',
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 18),
                    // Tags
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text("Offline", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text("Public", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text("Movie", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text("Funny", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    // Location
                    Row(
                      children: [
                        const Text(
                          "Location: ",
                          style: TextStyle(
                            color: Colors.white54,
                            fontFamily: 'JosefinSans',
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          location,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'JosefinSans',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Map placeholder below location, left aligned
                    Container(
                      width: 122,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/map_placeholder.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    // Aura and Host
                    Row(
                      children: [
                        const Text(
                          "AURA · 30+",
                          style: TextStyle(
                            color: Colors.white54,
                            fontFamily: 'JosefinSans',
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                  ],
                ),
              ),
            ),
            // Host info at the left bottom
            Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 8, top: 0, right: 24),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: useNetworkImages
                        ? NetworkImage(hostAvatar)
                        : AssetImage(hostAvatar) as ImageProvider,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Virat",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'JosefinSans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // ...you can add more host info here if needed...
                ],
              ),
            ),
            // Join Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GigChatPage(
                          eventName: eventName,
                          posterImage: posterImage, // <-- Pass posterImage here
                          hostAvatar: hostAvatar,
                          useNetworkImages: useNetworkImages,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Join $eventName",
                    style: const TextStyle(
                      color: Color(0xFF2B1F36),
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
