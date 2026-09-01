import 'package:flutter/material.dart';
import 'screens/auth_theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Application',
      theme: AuthTheme.theme(),
      home: const SplashScreen(),
    );
  }
}
