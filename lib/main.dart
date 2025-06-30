import 'package:flutter/material.dart';
import 'screens/orbit.dart'; // Adjust path if needed

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Orbit App',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'JosefinSans',
        scaffoldBackgroundColor: const Color(0xFF281F35),
      ),
      home: const Orbit(),
    );
  }
}
