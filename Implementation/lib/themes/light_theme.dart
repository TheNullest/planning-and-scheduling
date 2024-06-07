import 'package:flutter/material.dart';
import 'package:zamaan/themes/custom_theme_extension.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
  ),
  dividerTheme: const DividerThemeData(
    thickness: .3,
    indent: 50,
    endIndent: 50,
    space: 20,
    color: Color.fromRGBO(0, 255, 255, 1),
  ),
).copyWith(extensions: <ThemeExtension<dynamic>>[
  CustomThemeExtension(
    backgroundColor: const Color.fromARGB(255, 207, 207, 207),
    sectionColor: const Color.fromARGB(255, 0, 3, 189),
    textFieldBackgroundColor: const Color.fromRGBO(66, 66, 66, 1),
    //text
    textColor: const Color.fromARGB(255, 231, 231, 231),
    textFieldForegroundColor: const Color.fromARGB(255, 201, 0, 0),
    textFieldHintColor: const Color.fromRGBO(244, 244, 250, .3),
    textFieldCursorColor: const Color.fromRGBO(244, 244, 250, .3),
    textFieldEnabledBorderColor: const Color.fromARGB(126, 250, 250, 252),
    textFieldFocusedBorderColor: const Color.fromARGB(126, 250, 250, 252),
    sectionBorderColor: const Color.fromRGBO(223, 223, 223, 1),
    buttonBackgroundColor: const Color.fromARGB(255, 196, 55, 0),
    buttonForegroundColor: const Color.fromARGB(255, 223, 201, 8),
    buttonHoverdBackgroundColor: const Color.fromARGB(255, 21, 80, 80),
    buttonPressedBackgroundColor: const Color.fromARGB(255, 7, 100, 100),

    taskButtonBorderColor: const Color.fromARGB(255, 35, 35, 35),
    //task button
    taskButtonForegroundColor: const Color.fromRGBO(255, 255, 255, 1),
    taskButtonBackgroundColor: const Color.fromARGB(255, 16, 77, 231),
    taskButtonHoverdBackgroundColor: const Color.fromARGB(255, 7, 68, 224),
    taskButtonActivatedBackgroundColor: const Color.fromARGB(255, 4, 62, 209),

    // text button without field
    textButtonColor: const Color.fromARGB(255, 233, 233, 233),
    textButtonHoveredColor: const Color.fromARGB(255, 184, 250, 250),
    textButtonPressedColor: const Color.fromARGB(255, 252, 159, 159),
    shadowOnBackgroundColor: const Color.fromRGBO(234, 234, 243, 1),
    shadowOnSurfaceColor: const Color.fromRGBO(244, 244, 250, 1),
    selectedTabColor: const Color.fromRGBO(127, 177, 252, 1),
    unSelectedTabColor: const Color.fromRGBO(104, 103, 103, 1),
    tabIconShadowColor: const Color.fromRGBO(255, 255, 255, .3),
    errorTextColor: const Color.fromRGBO(197, 70, 70, 1),
    errorFieldColor: const Color.fromRGBO(197, 70, 70, 1),
  )
]);
