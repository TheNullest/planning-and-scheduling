import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    colorScheme: const ColorScheme(
  brightness: Brightness.light,
  primary: Color.fromRGBO(255, 255, 255, 1),
  onPrimary: Color.fromRGBO(19, 15, 36, 1),
  secondary: Color.fromRGBO(70, 70, 70, 1),
  onSecondary: Color.fromRGBO(42, 52, 78, 1),
  error: Color.fromRGBO(244, 57, 57, 1),
  onError: Color.fromRGBO(255, 255, 255, 1),
  background: Color.fromRGBO(10, 17, 36, 1),
  onBackground: Color.fromRGBO(234, 234, 243, 1),

  // widgets
  surface: Color.fromRGBO(45, 45, 45, 1),
  onSurface: Color.fromRGBO(244, 244, 250, 1),

  // hints
  tertiary: Color.fromRGBO(244, 244, 250, .3),
));
