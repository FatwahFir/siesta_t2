import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData theme = ThemeData(
  useMaterial3: true,
  primaryColor: green,
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Color(0xFF4CAF50), // Green for selected icon
    unselectedItemColor: Colors.grey,
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  cardTheme: CardTheme(
    color: Colors.white,
    shadowColor: Colors.grey[200],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontSize: 14,
      color: grey,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: grey,
    ),
    titleMedium: TextStyle(
      fontSize: 17,
      color: black,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      color: black,
      fontWeight: FontWeight.bold,
    ),
  ),
  fontFamily: GoogleFonts.inter().fontFamily,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: green,
    secondary: lightGreen,
    tertiary: black,
    outline: grey2,
    inversePrimary: grey,
  ),
);

const green = Color(0xFF4FAF5A);
final lightGreen = const Color(0xFF4FAF5A).withOpacity(0.1);
const titleColor = Color(0xFF1D1D21);
const black = Color(0xFF1D1D21);
const grey = Color(0xFF878787);
const grey2 = Color(0xFFC2C2C2);
const red = Color(0xFFC01212);
const yellow = Color(0xFFF2B90D);
