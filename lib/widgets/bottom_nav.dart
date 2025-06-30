import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;
  final bool highlightHome;

  const CustomBottomNavBar({
    super.key,
    this.currentIndex = 0,
    this.onTap,
    this.highlightHome = false,
  });

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


            // 2) Group - SVG icon
            Transform.rotate(
  angle: 0.785398, // 45 degrees in radians = π/4 ≈ 0.785398
  child: SvgPicture.asset(
    'assets/icons/circles.svg',
    width: 26,
    height: 26,
    colorFilter: const ColorFilter.mode(Colors.white70, BlendMode.srcIn),
  ),
),


            // 3) Home → radius.png icon with white glow if highlightHome
GestureDetector(
  onTap: () => onTap?.call(0),
  child: Container(
    decoration: highlightHome
        ? BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                blurRadius: 18,
                spreadRadius: 2,
              ),
            ],
          )
        : null,
    child: Image.asset(
      'assets/icons/radius.png',
      width: 34,
      height: 34,
    ),
  ),
),


            // 4) Event (ticket.svg) - now tappable and highlights when active
GestureDetector(
  onTap: () => onTap?.call(1),
  child: Transform.rotate(
    angle: -0.785398, // 45 degrees in radians
    child: SizedBox(
      width: 26, // Reduced width
      child: SvgPicture.asset(
        'assets/icons/ticket.svg',
        width: 26,
        height: 26,
        colorFilter: ColorFilter.mode(
          currentIndex == 1 ? Colors.white : Colors.white70,
          BlendMode.srcIn,
        ),
      ),
    ),
  ),
),



            // 5) Profile
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
