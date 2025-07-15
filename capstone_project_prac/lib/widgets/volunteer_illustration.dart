import 'package:flutter/material.dart';

class VolunteerIllustration extends StatelessWidget {
  final double width;
  final double height;

  const VolunteerIllustration({Key? key, this.width = 140, this.height = 140}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/volunteer.png',
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }
} 