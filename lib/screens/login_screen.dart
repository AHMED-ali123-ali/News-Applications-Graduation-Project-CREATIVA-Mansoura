import 'package:flutter/material.dart';
import 'package:news_application/screens/forgotPassword.dart';
import 'auth_theme.dart';
import 'create_account_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _password = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =========================
            // HEADER
            // =========================
            Transform.translate(
              offset: const Offset(0, -22),
              child: const Center(
                child: AuthHeader(
                  eyebrow: 'Welcome back',
                  title: 'Log in to your account',
                  subtitle:
                  'Continue your journey and catch up on the stories that matter to you.',
                ),
              ),
            ),

            const SizedBox(height: 4),

            // =========================
            // EMAIL
            // =========================
            const Text(
              'Email',
              style: TextStyle(
                color: AuthTheme.ink,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 7),

            TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              style: const TextStyle(
                fontSize: 16,
                color: AuthTheme.ink,
              ),
              decoration: InputDecoration(
                hintText: 'you@example.com',
                hintStyle: const TextStyle(
                  color: AuthTheme.muted,
                  fontSize: 15,
                ),
                prefixIcon: const Icon(
                  Icons.mail_outline_rounded,
                  size: 22,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFFE5DFD1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AuthTheme.goldenYellow,
                    width: 2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email';
                }

                final emailRegex =
                RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

                if (!emailRegex.hasMatch(value.trim())) {
                  return 'Please enter a valid email address';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            // =========================
            // PASSWORD
            // =========================
            const Text(
              'Password',
              style: TextStyle(
                color: AuthTheme.ink,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 7),

            TextFormField(
              controller: _password,
              obscureText: _obscurePassword,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _login(),
              style: const TextStyle(
                fontSize: 16,
                color: AuthTheme.ink,
              ),
              decoration: InputDecoration(
                hintText: 'Enter your password',
                hintStyle: const TextStyle(
                  color: AuthTheme.muted,
                  fontSize: 15,
                ),
                prefixIcon: const Icon(
                  Icons.lock_outline_rounded,
                  size: 22,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 22,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFFE5DFD1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AuthTheme.goldenYellow,
                    width: 2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }

                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }

                return null;
              },
            ),

            const SizedBox(height: 3),

            // =========================
            // FORGOT PASSWORD
            // =========================
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _forgotPassword,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 6,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: AuthTheme.goldenYellow,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 13),

            // =========================
            // LOGIN BUTTON
            // =========================
            SizedBox(
              width: double.infinity,
              height: 64,
              child: AuthButton(
                label: 'Login',
                icon: Icons.login_rounded,
                onPressed: _login,
              ),
            ),

            const SizedBox(height: 21),

            // =========================
            // OR
            // =========================
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: Color(0xFFE5DFD1),
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    'OR',
                    style: TextStyle(
                      color: AuthTheme.muted,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: Color(0xFFE5DFD1),
                    thickness: 1,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 19),

            // =========================
            // CREATE ACCOUNT
            // =========================
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: AuthTheme.muted,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: _createAccount,
                    child: const Text(
                      'Create New Account',
                      style: TextStyle(
                        color: AuthTheme.goldenYellow,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  // =========================
  // LOGIN
  // =========================
  void _login() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
          (route) => false,
    );
  }

  // =========================
  // CREATE ACCOUNT
  // =========================
  void _createAccount() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const CreateAccountScreen(),
      ),
    );
  }

  // =========================
  // FORGOT PASSWORD
  // =========================
  void _forgotPassword() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const ForgotPassword(),
      ),
    );
  }
}