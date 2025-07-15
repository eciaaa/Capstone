import 'package:flutter/material.dart';
import '../utils/theme.dart';

class HelpPrivacyScreen extends StatelessWidget {
  const HelpPrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: gradientStart,
        elevation: 0,
        title: const Text('Help and Privacy'),
      ),
      body: const Center(
        child: Text('Help and Privacy information coming soon!', style: TextStyle(fontSize: 18)),
      ),
    );
  }
} 