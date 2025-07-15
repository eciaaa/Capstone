import 'package:flutter/material.dart';

const Color gradientStart = Color(0xFF14c8a8);
const Color gradientEnd = Color(0xFF006682);

final ThemeData appTheme = ThemeData(
  primaryColor: gradientStart,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Poppins',
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontFamily: 'Poppins', fontSize: 32, fontWeight: FontWeight.w700, color: Colors.black, letterSpacing: 1.2),
    titleLarge: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black, letterSpacing: 1.1),
    bodyLarge: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black, letterSpacing: 0.5),
    bodyMedium: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black, letterSpacing: 0.25),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: gradientStart),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: gradientEnd),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    fillColor: Colors.white,
    filled: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      elevation: 2,
    ),
  ),
); 