import 'package:flutter/material.dart';
import 'package:zamaan/themes/custom_theme_extension.dart';

final lightTheme = ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
  CustomThemeExtension(
    backgroundColor: const Color.fromRGBO(31, 31, 31, 1),
    sectionColor: Colors.red,
    textFieldBackgroundColor: const Color.fromRGBO(66, 66, 66, 1),
    textFieldForegroundColor: const Color.fromARGB(255, 0, 64, 201),
    textFieldHintColor: const Color.fromRGBO(244, 244, 250, .3),
    textFieldCursorColor: const Color.fromRGBO(244, 244, 250, .3),
    textFieldEnabledBorderColor: const Color.fromARGB(126, 250, 250, 252),
    textFieldFocusedBorderColor: const Color.fromARGB(126, 250, 250, 252),
    sectionBorderColor: const Color.fromRGBO(223, 223, 223, 1),
    buttonBackgroundColor: Color.fromARGB(255, 196, 55, 0),
    buttonForegroundColor: const Color.fromRGBO(255, 255, 255, 1),
    shadowOnBackgroundColor: const Color.fromRGBO(234, 234, 243, 1),
    shadowOnSurfaceColor: const Color.fromRGBO(244, 244, 250, 1),
    selectedTabColor: const Color.fromRGBO(127, 177, 252, 1),
    unSelectedTabColor: const Color.fromRGBO(104, 103, 103, 1),
    iconShadowColor: const Color.fromRGBO(255, 255, 255, .3),
    errorTextColor: const Color.fromRGBO(197, 70, 70, 1),
    errorFieldColor: const Color.fromRGBO(197, 70, 70, 1),
  )
]);
