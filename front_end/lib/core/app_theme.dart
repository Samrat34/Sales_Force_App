import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFF0066CC),
  primarySwatch: Colors.blue,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    accentColor: const Color(0xFF00CED1),
    backgroundColor: const Color(0xFFF0F8FF),
  ),
  scaffoldBackgroundColor: const Color(0xFFF0F8FF),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color(0xFF0066CC),
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Color(0xFF0066CC),
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(color: Color(0xFF2F4F4F)),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF0066CC),
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF0066CC),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF00CED1)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF0066CC), width: 2),
    ),
  ),
);
