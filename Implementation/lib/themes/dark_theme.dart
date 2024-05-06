import 'package:flutter/material.dart';

import 'custom_theme_extension.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Color.fromRGBO(31, 31, 31, 1),
  ),
).copyWith(extensions: <ThemeExtension<dynamic>>[
  CustomThemeExtension(
    backgroundColor: const Color.fromRGBO(31, 31, 31, 1),
    sectionColor: const Color.fromRGBO(45, 45, 45, 1),
    sectionBorderColor: const Color.fromARGB(255, 70, 70, 70),

    //textFields
    textFieldBackgroundColor: const Color.fromRGBO(66, 66, 66, 1),
    textFieldForegroundColor: const Color.fromARGB(255, 231, 231, 231),
    textFieldHintColor: const Color.fromRGBO(244, 244, 250, .5),
    textFieldCursorColor: const Color.fromARGB(126, 250, 250, 252),
    textFieldEnabledBorderColor: const Color.fromARGB(125, 255, 255, 255),
    textFieldFocusedBorderColor: const Color.fromARGB(45, 143, 143, 1),

    //buttons
    buttonBackgroundColor: const Color.fromRGBO(45, 143, 143, 1),
    buttonForegroundColor: const Color.fromRGBO(255, 255, 255, 1),

    //shadows
    shadowOnBackgroundColor: const Color.fromRGBO(234, 234, 243, 1),
    shadowOnSurfaceColor: const Color.fromRGBO(244, 244, 250, 1),

    //tabBars
    selectedTabColor: const Color.fromRGBO(127, 177, 252, 1),
    unSelectedTabColor: const Color.fromRGBO(104, 103, 103, 1),
    iconShadowColor: const Color.fromRGBO(255, 255, 255, .3),

    //errors
    errorTextColor: const Color.fromRGBO(197, 70, 70, 1),
    errorFieldColor: const Color.fromRGBO(197, 70, 70, 1),
  )
]);
