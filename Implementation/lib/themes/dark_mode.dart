import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    colorScheme: const ColorScheme(
  brightness: Brightness.dark,
  background: Color.fromRGBO(31, 31, 31, 1),

  // section
  surface: Color.fromRGBO(45, 45, 45, 1),

  // text field
  primary: Color.fromRGBO(66, 66, 66, 1),
  onPrimary: Color.fromRGBO(223, 223, 223, 1),

  // button field
  secondary: Color.fromRGBO(45, 143, 143, 1),
  onSecondary: Color.fromRGBO(255, 255, 255, 1),

  error: Color.fromRGBO(37, 37, 37, 1),
  onError: Color.fromRGBO(197, 70, 70, 1),

  // for text field and buttons
  shadow: Color.fromRGBO(19, 19, 19, 1),

  onBackground: Color.fromRGBO(234, 234, 243, 1),

  onSurface: Color.fromRGBO(244, 244, 250, 1),

  // hints
  tertiary: Color.fromRGBO(244, 244, 250, .3),
));
