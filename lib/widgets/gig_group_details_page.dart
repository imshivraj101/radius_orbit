import 'package:flutter/material.dart';

class GigGroupDetailsPage extends StatelessWidget {
  final String eventName;
  final String posterImage;
  final bool useNetworkImages;

  const GigGroupDetailsPage({
    super.key,
    required this.eventName,
    required this.posterImage,
    this.useNetworkImages = false,
  });

  @override
  Widget build(BuildContext context) {
    // Dummy members list
    final members = [
      {'name': 'Virat', 'avatar': posterImage},
      {'name': 'Rohit', 'avatar': posterImage},
      {'name': 'Anushka', 'avatar': posterImage},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF2B1F36),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B1F36),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Group Details",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'JosefinSans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: useNetworkImages
                  ? Image.network(posterImage, width: 90, height: 120, fit: BoxFit.cover)
                  : Image.asset(posterImage, width: 90, height: 120, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              eventName,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'JosefinSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Members",
            style: TextStyle(
              color: Colors.white70,
              fontFamily: 'JosefinSans',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10),
          ...members.map((m) => ListTile(
                leading: ClipOval(
                  child: useNetworkImages
                      ? Image.network(m['avatar']!, width: 36, height: 36, fit: BoxFit.cover)
                      : Image.asset(m['avatar']!, width: 36, height: 36, fit: BoxFit.cover),
                ),
                title: Text(
                  m['name']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'JosefinSans',
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.white54),
                  onPressed: () {},
                ),
              )),
          const SizedBox(height: 30),
          ListTile(
            leading: const Icon(Icons.person_add_alt_1, color: Colors.white),
            title: const Text("Add Members", style: TextStyle(color: Colors.white)),
            onTap: () {
              // TODO: Add members logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.redAccent),
            title: const Text("Leave Group", style: TextStyle(color: Colors.redAccent)),
            onTap: () {
              // TODO: Leave group logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.report, color: Colors.orangeAccent),
            title: const Text("Report Group", style: TextStyle(color: Colors.orangeAccent)),
            onTap: () {
              // TODO: Report group logic
            },
          ),
        ],
      ),
    );
  }
}
