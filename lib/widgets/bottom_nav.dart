import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 27, 19, 37),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: const Color(0xFFAE00FF),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 1) Create
            Icon(
  Icons.camera_alt,
  color: Colors.white70,
  size: 28,
),


            // 2) Group
             // Group - SVG icon
            Transform.rotate(
  angle: 0.785398, // 45 degrees in radians = π/4 ≈ 0.785398
  child: SvgPicture.asset(
    'assets/icons/circles.svg',
    width: 26,
    height: 26,
    colorFilter: const ColorFilter.mode(Colors.white70, BlendMode.srcIn),
  ),
),


            // 3) Home → radius.png icon
            Image.asset(
              'assets/icons/radius.png',
              width: 34,
              height: 34,
             
            ),

            // 4) Event (ticket.svg)
Transform.rotate(
  angle: -0.785398, // 45 degrees in radians
  child: SizedBox(
    width: 26, // Reduced width
    child: Icon(
      Icons.confirmation_num_outlined,
      color: Colors.white70,
      size: 26,
    ),
  ),
),



            Container(
  padding: const EdgeInsets.all(0.25),
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(color: Colors.white70, width: 1), // optional white stroke
  ),
  child: const CircleAvatar(
    radius: 16,
    backgroundImage: AssetImage('assets/icons/virat.jpg'),
  ),
),

          ],
        ),
      ),
    );
  }
}
