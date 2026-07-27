import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFFF7A00);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
    ),
    scaffoldBackgroundColor: const Color(0xFFF8F8F8),
  );
}