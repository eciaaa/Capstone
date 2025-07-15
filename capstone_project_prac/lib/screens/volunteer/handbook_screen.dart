import 'package:flutter/material.dart';
import '../../utils/theme.dart';

class VolunteerHandbookScreen extends StatelessWidget {
  const VolunteerHandbookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: gradientStart,
        elevation: 0,
        title: const Text('Volunteer Handbook'),
      ),
      body: const Center(
        child: Text('Volunteer handbook coming soon!', style: TextStyle(fontSize: 18)),
      ),
    );
  }
} 