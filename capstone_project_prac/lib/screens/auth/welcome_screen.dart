import 'package:flutter/material.dart';
import '../../utils/theme.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/logo_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
          children: [
            const Spacer(flex: 2),
            const LogoWidget(width: 300, height: 300),
            const SizedBox(height: 40),
            Text(
              'Welcome!',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            GradientButton(
              text: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            const SizedBox(height: 16),
            GradientButton(
              text: 'Sign Up',
              onPressed: () {
                Navigator.pushNamed(context, '/signup-choice');
              },
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
} 