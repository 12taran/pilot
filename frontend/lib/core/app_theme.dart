// app_theme.dart

import 'package:flutter/material.dart';
import 'package:pilot_project/core/config.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    fontFamily: Constants.fontFamily,
    primaryColor:const Color.fromARGB(255, 56, 98, 57),
    scaffoldBackgroundColor: Colors.white,
    hintColor: const Color(0xFFBDBDBD),
    appBarTheme: const AppBarTheme(
      backgroundColor: const Color.fromARGB(255, 56, 98, 57),
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
        labelMedium: TextStyle(color: Colors.black54)),
    colorScheme: const ColorScheme.light(
      primary:const Color.fromARGB(255, 56, 98, 57),
      secondary: const Color.fromARGB(255, 56, 98, 57),
      error: Colors.red,
      background: Colors.white,
      surface: Color(0xFFC5E3FC),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Colors.black,
      onSurface: Colors.black,
      onError: Colors.white,
    ).copyWith(error: Colors.red),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    fontFamily: Constants.fontFamily,
    primaryColor:const Color.fromARGB(255, 56, 98, 57),
    scaffoldBackgroundColor: const Color(0xFF000000),
    hintColor: const Color(0xFFBDBDBD),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E4175),
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      labelMedium: TextStyle(color: Colors.white54),
    ),
    colorScheme: const ColorScheme.dark(
      primary: const Color.fromARGB(255, 56, 98, 57),
      secondary: const Color.fromARGB(255, 56, 98, 57),
      error: Colors.red,
      background: Color(0xFF000000),
      surface: Color(0xFF212529),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Colors.white,
      onSurface: Colors.white,
      onError: Colors.white,
    ).copyWith(error: Colors.red),
  );
}
