import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: primaryColor,
  textTheme: textTheme,
  scaffoldBackgroundColor: const Color.fromARGB(255, 53, 52, 52),
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
  ),
);

final lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: primaryColor,
  textTheme: textTheme,
  scaffoldBackgroundColor: Colors.grey,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
  ),
);

const textTheme = TextTheme(
  titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
);

const primaryColor = Colors.blue;
