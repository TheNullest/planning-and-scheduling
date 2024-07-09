import 'package:flutter/material.dart';
import 'package:zamaan/themes/custom_theme_extension.dart';
import 'package:zamaan/themes/types/theme_types.dart';

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
).copyWith(extensions: <ThemeExtension<CustomThemeExtension>>[
  CustomThemeExtension(
    environmentColors: EnvironmentThemeColors(
        mainBackgroundColor: const Color.fromARGB(255, 22, 22, 22),
        mainTextColor: const Color.fromARGB(255, 231, 231, 231),
        mainDividerColor: const Color.fromARGB(255, 231, 231, 231),
        sectionBackgroundColor: const Color.fromRGBO(45, 45, 45, 1),
        sectionShadowColor: const Color.fromRGBO(234, 234, 243, 1),
        sectionTextColor: const Color.fromARGB(255, 231, 231, 231),
        sectionDividerColor: const Color.fromARGB(255, 231, 231, 231),
        sectionBorderColor: const Color.fromARGB(255, 70, 70, 70),
        widgetBackgroundColor: const Color.fromARGB(255, 65, 64, 64),
        widgetShadowColor: const Color.fromRGBO(244, 244, 250, 1),
        widgetTextColor: const Color.fromARGB(255, 231, 231, 231),
        widgetBorderColor: const Color.fromARGB(255, 70, 70, 70)),

    //textField
    textFieldColors: TextFieldThemeColors(
      textFieldBackgroundColor: const Color.fromRGBO(66, 66, 66, 1),
      textFieldForegroundColor: const Color.fromARGB(255, 231, 231, 231),
      textFieldHintColor: const Color.fromRGBO(244, 244, 250, .5),
      textFieldCursorColor: const Color.fromARGB(126, 250, 250, 252),
      textFieldEnabledBorderColor: const Color.fromARGB(125, 255, 255, 255),
      textFieldFocusedBorderColor: const Color.fromRGBO(45, 143, 143, 1),
    ),

    //button
    buttonColors: ButtonThemeColors(
        buttonForegroundColor: const Color.fromRGBO(255, 255, 255, 1),
        buttonBackgroundColor: const Color.fromARGB(255, 16, 77, 231),
        buttonHoverdBackgroundColor: const Color.fromARGB(255, 7, 68, 224),
        buttonPressedBackgroundColor: const Color.fromARGB(255, 4, 62, 209)),

    //task button
    taskButtonColors: TaskButtonThemeColors(
      taskButtonForegroundColor: const Color.fromRGBO(255, 255, 255, 1),
      taskButtonBackgroundColor: const Color.fromARGB(255, 60, 60, 60),
      taskButtonHoverdBackgroundColor: const Color.fromARGB(255, 50, 50, 50),
      taskButtonActivatedBackgroundColor: const Color.fromARGB(255, 35, 35, 35),
      taskButtonDoneBackgroundColor: const Color.fromARGB(255, 18, 77, 126),
      taskButtonBorderColor: const Color.fromARGB(255, 22, 22, 22),
    ),

    // text button without field
    textButtonColors: TextButtonThemeColors(
      textButtonColor: const Color.fromARGB(255, 235, 248, 248),
      textButtonHoveredColor: const Color.fromARGB(255, 165, 243, 243),
      textButtonPressedColor: const Color.fromARGB(255, 122, 233, 233),
    ),

    tabColors: TabThemeColors(
      selectedTabColor: const Color.fromRGBO(127, 177, 252, 1),
      unSelectedTabColor: const Color.fromRGBO(104, 103, 103, 1),
      tabIconShadowColor: const Color.fromRGBO(255, 255, 255, .3),
    ),

    questionBoxColors: ToastQuestionBoxThemeColors(
        headerColor: const Color.fromRGBO(197, 70, 70, 1),
        titleColor: const Color.fromRGBO(197, 70, 70, 1),
        backgroundColor: const Color.fromRGBO(197, 70, 70, 1),
        foregroundColor: const Color.fromRGBO(197, 70, 70, 1),
        confirmButtonBackgroundColor: const Color.fromRGBO(197, 70, 70, 1),
        cancelButtonForegroundColor: const Color.fromRGBO(197, 70, 70, 1)),
    successBoxColors: ToastSuccessBoxThemeColors(
        headerColor: const Color.fromRGBO(197, 70, 70, 1),
        titleColor: const Color.fromRGBO(197, 70, 70, 1),
        backgroundColor: const Color.fromRGBO(197, 70, 70, 1),
        foregroundColor: const Color.fromRGBO(197, 70, 70, 1),
        confirmButtonBackgroundColor: const Color.fromRGBO(197, 70, 70, 1)),

    errorBoxColors: ToastErrorBoxThemeColors(
        headerColor: const Color.fromRGBO(197, 70, 70, 1),
        titleColor: const Color.fromRGBO(197, 70, 70, 1),
        backgroundColor: const Color.fromRGBO(197, 70, 70, 1),
        foregroundColor: const Color.fromRGBO(197, 70, 70, 1),
        confirmButtonBackgroundColor: const Color.fromRGBO(197, 70, 70, 1)),
  )
]);
