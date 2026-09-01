import 'package:flutter/material.dart';

class AuthTheme {
  AuthTheme._();

  static const Color goldenYellow = Color(0xFFE2A51A);
  static const Color goldenLight = Color(0xFFFFD66B);
  static const Color ink = Color(0xFF1D2433);
  static const Color muted = Color(0xFF737B8C);
  static const Color surface = Color(0xFFFFFBF2);

  static ThemeData theme() {
    final scheme = ColorScheme.fromSeed(
      seedColor: goldenYellow,
      brightness: Brightness.light,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme.copyWith(
        primary: goldenYellow,
        onPrimary: Colors.white,
        surface: surface,
      ),
      scaffoldBackgroundColor: surface,
      fontFamily: 'Roboto',
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFE9E3D5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: goldenYellow, width: 1.5),
        ),
        hintStyle: const TextStyle(color: muted),
      ),
    );
  }
}

class BrandMark extends StatelessWidget {
  final double size;
  final bool compact;

  const BrandMark({super.key, this.size = 74, this.compact = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size * .28),
            boxShadow: const [
              BoxShadow(color: Color(0x24000000), blurRadius: 20, offset: Offset(0, 8)),
            ],
          ),
          child: Icon(Icons.newspaper_rounded, color: AuthTheme.goldenYellow, size: size * .52),
        ),
        if (!compact) ...[
          const SizedBox(height: 18),
          const Text(
            'NEWS APPLICATION',
            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: 2.2),
          ),
        ],
      ],
    );
  }
}

class AuthHeader extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String subtitle;

  const AuthHeader({super.key, required this.eyebrow, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(eyebrow.toUpperCase(), style: const TextStyle(color: AuthTheme.goldenYellow, fontWeight: FontWeight.w800, letterSpacing: 1.4, fontSize: 12)),
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(color: AuthTheme.ink, fontSize: 30, height: 1.12, fontWeight: FontWeight.w800)),
        const SizedBox(height: 10),
        Text(subtitle, style: const TextStyle(color: AuthTheme.muted, fontSize: 15, height: 1.5)),
      ],
    );
  }
}

class AuthButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData icon;

  const AuthButton({super.key, required this.label, required this.onPressed, this.icon = Icons.arrow_forward_rounded});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
        style: ElevatedButton.styleFrom(
          backgroundColor: AuthTheme.goldenYellow,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        ),
      ),
    );
  }
}

class AuthField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool obscureText;
  final TextEditingController? controller;

  const AuthField({super.key, required this.label, required this.hint, required this.icon, this.obscureText = false, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: AuthTheme.ink, fontWeight: FontWeight.w700, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(controller: controller, obscureText: obscureText, keyboardType: label == 'Email' ? TextInputType.emailAddress : null, decoration: InputDecoration(hintText: hint, prefixIcon: Icon(icon, color: AuthTheme.goldenYellow))),
      ],
    );
  }
}

class AuthShell extends StatelessWidget {
  final Widget child;
  final VoidCallback? onBack;

  const AuthShell({super.key, required this.child, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (onBack != null) IconButton(onPressed: onBack, icon: const Icon(Icons.arrow_back_rounded), padding: EdgeInsets.zero),
                  if (onBack != null) const SizedBox(height: 20),
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
