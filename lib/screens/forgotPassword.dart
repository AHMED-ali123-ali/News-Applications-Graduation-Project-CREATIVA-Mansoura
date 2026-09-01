import 'package:flutter/material.dart';
import 'auth_theme.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}
class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
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
                  eyebrow: 'Password Recovery',
                  title: 'Forgot your password?',
                  subtitle:
                  'Enter your email address and we will send you a link to reset your password.',
                ),
              ),
            ),
            const SizedBox(height: 6),
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
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _resetPassword(),
              style: const TextStyle(
                color: AuthTheme.ink,
                fontSize: 16,
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
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
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
            const SizedBox(height: 20),
            // =========================
            // RESET BUTTON
            // =========================
            SizedBox(
              width: double.infinity,
              height: 64,
              child: AuthButton(
                label: 'Send Reset Link',
                icon: Icons.mark_email_read_outlined,
                onPressed: _resetPassword,
              ),
            ),
            const SizedBox(height: 20),
            // =========================
            // BACK TO LOGIN
            // =========================
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  const Text(
                    'Remember your password? ',
                    style: TextStyle(
                      color: AuthTheme.muted,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Login',
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
  // RESET PASSWORD
  // =========================
  void _resetPassword() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Password reset link has been sent to your email.',
        ),
      ),
    );
  }
}