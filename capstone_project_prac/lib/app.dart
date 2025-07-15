import 'package:flutter/material.dart';
import 'screens/auth/welcome_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_choice_screen.dart';
import 'screens/auth/signup_public_screen.dart';
import 'screens/auth/signup_volunteer_screen.dart';
import 'screens/home_screen.dart';
import 'utils/theme.dart';

class ResponSyncApp extends StatelessWidget {
  const ResponSyncApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ResponSync',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const WelcomeScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup-choice': (context) => const SignUpChoiceScreen(),
        '/signup-public': (context) => const SignUpPublicScreen(),
        '/signup-volunteer': (context) => const SignUpVolunteerScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
} 