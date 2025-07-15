import 'package:flutter/material.dart';
import '../utils/theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: gradientStart,
        elevation: 0,
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text('Settings feature coming soon!', style: TextStyle(fontSize: 18)),
      ),
    );
  }
} 