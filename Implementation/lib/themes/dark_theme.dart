import 'package:flutter/material.dart';
import 'package:zamaan/themes/custom_theme_extension.dart';

final darkTheme = ThemeData(
  textTheme: const TextTheme(
    /// set default text color
    bodyMedium: TextStyle(
      color: Color.fromARGB(255, 231, 231, 231),
    ),
  ),
  scaffoldBackgroundColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Color.fromARGB(255, 231, 231, 231)),
  dividerTheme: const DividerThemeData(
    thickness: .3,
    indent: 50,
    endIndent: 50,
    space: 20,
    color: Color.fromARGB(255, 255, 255, 255),
  ),
).copyWith(extensions: <ThemeExtension<dynamic>>[
  CustomThemeExtension(
    backgroundColor: const Color.fromARGB(255, 22, 22, 22),
    sectionColor: const Color.fromRGBO(45, 45, 45, 1),
    sectionBorderColor: const Color.fromARGB(255, 70, 70, 70),

    //text
    textColor: const Color.fromARGB(255, 231, 231, 231),

    //textField
    textFieldBackgroundColor: const Color.fromRGBO(66, 66, 66, 1),
    textFieldForegroundColor: const Color.fromARGB(255, 231, 231, 231),
    textFieldHintColor: const Color.fromRGBO(244, 244, 250, .5),
    textFieldCursorColor: const Color.fromARGB(126, 250, 250, 252),
    textFieldEnabledBorderColor: const Color.fromARGB(125, 255, 255, 255),
    textFieldFocusedBorderColor: const Color.fromRGBO(45, 143, 143, 1),

    //button
    buttonForegroundColor: const Color.fromRGBO(255, 255, 255, 1),
    buttonBackgroundColor: const Color.fromARGB(255, 16, 77, 231),
    buttonHoverdBackgroundColor: const Color.fromARGB(255, 7, 68, 224),
    buttonPressedBackgroundColor: const Color.fromARGB(255, 4, 62, 209),

    //task button
    taskButtonForegroundColor: const Color.fromRGBO(255, 255, 255, 1),
    taskButtonBackgroundColor: const Color.fromARGB(255, 60, 60, 60),
    taskButtonHoverdBackgroundColor: const Color.fromARGB(255, 50, 50, 50),
    taskButtonActivatedBackgroundColor: const Color.fromARGB(255, 35, 35, 35),
    taskButtonBorderColor: Colors.black,

    // text button without field
    textButtonColor: const Color.fromARGB(255, 235, 248, 248),
    textButtonHoveredColor: const Color.fromARGB(255, 165, 243, 243),
    textButtonPressedColor: const Color.fromARGB(255, 122, 233, 233),

    //shadows
    shadowOnBackgroundColor: const Color.fromRGBO(234, 234, 243, 1),
    shadowOnSurfaceColor: const Color.fromRGBO(244, 244, 250, 1),

    //tabBars
    selectedTabColor: const Color.fromRGBO(127, 177, 252, 1),
    unSelectedTabColor: const Color.fromRGBO(104, 103, 103, 1),
    tabIconShadowColor: const Color.fromRGBO(255, 255, 255, .3),

    //errors
    errorTextColor: const Color.fromRGBO(197, 70, 70, 1),
    errorFieldColor: const Color.fromRGBO(197, 70, 70, 1),
  )
]);
