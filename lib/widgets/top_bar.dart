import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/radius_chat_page.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Notification bell icon (SVG)
          SvgPicture.asset(
            'assets/icons/bell.svg',
            width: 26,
            height: 26,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),

          // Aura pill shifted left
          Transform.translate(
            offset: const Offset(-80, 0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purpleAccent, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Aura : 1000M',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // Message icon without white circle
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => RadiusChatPage(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/message.svg',
              width: 26,
              height: 26,
              colorFilter: const ColorFilter.mode(Color.fromARGB(255, 255, 255, 255), BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
