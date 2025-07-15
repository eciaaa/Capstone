import 'package:flutter/material.dart';
import '../../utils/theme.dart';

class TrainingModulesScreen extends StatelessWidget {
  const TrainingModulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: gradientStart,
        elevation: 0,
        title: const Text('Training Modules'),
      ),
      body: const Center(
        child: Text('Training modules coming soon!', style: TextStyle(fontSize: 18)),
      ),
    );
  }
} 