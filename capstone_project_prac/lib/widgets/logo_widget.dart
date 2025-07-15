import 'package:flutter/material.dart';

enum LogoType { main, text }

class LogoWidget extends StatelessWidget {
  final double width;
  final double height;
  final LogoType type;

  const LogoWidget({Key? key, this.width = 150, this.height = 150, this.type = LogoType.main}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      type == LogoType.text ? 'assets/images/logo_text.png' : 'assets/images/logo.png',
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }
} 