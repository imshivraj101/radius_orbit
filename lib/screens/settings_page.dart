import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF281F35),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Settings",
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        children: [
          // Profile Card
          Container(
            padding: const EdgeInsets.all(18),
            margin: const EdgeInsets.only(bottom: 18),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('assets/icons/virat.jpg'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Virat Kohli",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'JosefinSans',
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "@imvk18",
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'JosefinSans',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(Icons.chevron_right, color: Colors.white54, size: 28),
              ],
            ),
          ),
          // Settings options
          _SettingsTile(
            icon: Icons.person,
            label: "Edit Profile",
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.lock,
            label: "Change Password",
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.notifications,
            label: "Notifications",
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.privacy_tip,
            label: "Privacy",
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.palette,
            label: "Theme",
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.help_outline,
            label: "Help & Support",
            onTap: () {},
          ),
          const SizedBox(height: 12),
          _SettingsTile(
            icon: Icons.logout,
            label: "Logout",
            iconColor: Colors.redAccent,
            textColor: Colors.redAccent,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? textColor;

  const _SettingsTile({
    required this.icon,
    required this.label,
    this.onTap,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF281F35), // Match background color
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Icon(icon, color: iconColor ?? Colors.white, size: 24),
              const SizedBox(width: 18),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.white24, size: 22),
            ],
          ),
        ),
      ),
    );
  }
}
