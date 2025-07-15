import 'package:flutter/material.dart';
import '../../utils/theme.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/logo_widget.dart';

class SignUpChoiceScreen extends StatelessWidget {
  const SignUpChoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [gradientStart, gradientEnd],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(width: 240, height: 240),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Choose user account',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 32),
                  GradientButton(
                    text: 'PUBLIC USER',
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup-public');
                    },
                  ),
                  const SizedBox(height: 16),
                  GradientButton(
                    text: 'VOLUNTEER',
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup-volunteer');
                    },
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text('ALREADY HAVE AN ACCOUNT? SIGN IN'),
                    style: TextButton.styleFrom(foregroundColor: gradientEnd),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 