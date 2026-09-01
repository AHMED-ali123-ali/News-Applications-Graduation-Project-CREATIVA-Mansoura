import 'package:flutter/material.dart';
import 'auth_theme.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Column(
                children: [
                  SizedBox(
                    height: height < 700 ? 10 : 34,
                  ),

                  Container(
                    height: height < 700 ? 190 : 260,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AuthTheme.goldenYellow,
                          Color(0xFFF4C64E),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(34),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -28,
                          top: -35,
                          child: _WelcomeCircle(
                            diameter: 150,
                            opacity: .18,
                          ),
                        ),

                        Positioned(
                          left: -45,
                          bottom: -80,
                          child: _WelcomeCircle(
                            diameter: 190,
                            opacity: .12,
                          ),
                        ),

                        const Center(
                          child: Icon(
                            Icons.article_rounded,
                            color: Colors.white,
                            size: 96,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 34),

                  const Text(
                    'Welcome to News Application',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AuthTheme.ink,
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      height: 1.15,
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    'Stay informed with the latest headlines and important stories all in one simple place',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:Colors.black87,
                      fontSize: 18,
                      height: 1.55,
                    ),
                  ),

                  const SizedBox(height: 34),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: AuthButton(
                      label: 'Get Started',
                      onPressed: () => _openLogin(context),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openLogin(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),
    );
  }
}

class _WelcomeCircle extends StatelessWidget {
  final double diameter;
  final double opacity;

  const _WelcomeCircle({
    required this.diameter,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(opacity),
      ),
    );
  }
}