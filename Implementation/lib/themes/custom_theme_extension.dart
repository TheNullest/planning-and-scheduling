import 'package:flutter/material.dart';
import 'package:zamaan/themes/types/theme_types.dart';

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final EnvironmentThemeColors environmentColors;
  final TextFieldThemeColors textFieldColors;
  final ButtonThemeColors buttonColors;
  final TabThemeColors tabColors;
  final TaskButtonThemeColors taskButtonColors;
  final TextButtonThemeColors textButtonColors;
  final ToastQuestionBoxThemeColors questionBoxColors;
  final ToastSuccessBoxThemeColors successBoxColors;
  final ToastErrorBoxThemeColors errorBoxColors;

  CustomThemeExtension({
    required this.environmentColors,
    required this.textFieldColors,
    required this.buttonColors,
    required this.taskButtonColors,
    required this.textButtonColors,
    required this.tabColors,
    required this.questionBoxColors,
    required this.successBoxColors,
    required this.errorBoxColors,
  });

  @override
  CustomThemeExtension copyWith({
    EnvironmentThemeColors? environmentColors,
    TabThemeColors? tabColors,
    TextFieldThemeColors? textFieldColors,
    ButtonThemeColors? buttonColors,
    TaskButtonThemeColors? taskButtonColors,
    TextButtonThemeColors? textButtonColors,
    ToastQuestionBoxThemeColors? questionBoxColors,
    ToastSuccessBoxThemeColors? successBoxColors,
    ToastErrorBoxThemeColors? errorBoxColors,
  }) {
    return CustomThemeExtension(
      environmentColors: environmentColors ?? this.environmentColors,
      tabColors: tabColors ?? this.tabColors,
      textFieldColors: textFieldColors ?? this.textFieldColors,
      buttonColors: buttonColors ?? this.buttonColors,
      taskButtonColors: taskButtonColors ?? this.taskButtonColors,
      textButtonColors: textButtonColors ?? this.textButtonColors,
      questionBoxColors: questionBoxColors ?? this.questionBoxColors,
      successBoxColors: successBoxColors ?? this.successBoxColors,
      errorBoxColors: errorBoxColors ?? this.errorBoxColors,
    );
  }

  @override
  CustomThemeExtension lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;

    return CustomThemeExtension(
        environmentColors: environmentColors.lerp(environmentColors, t),
        textFieldColors: textFieldColors.lerp(textFieldColors, t),
        buttonColors: buttonColors.lerp(other.buttonColors, t),
        taskButtonColors: taskButtonColors.lerp(other.taskButtonColors, t),
        textButtonColors: textButtonColors.lerp(other.textButtonColors, t),
        tabColors: tabColors.lerp(tabColors, t),
        questionBoxColors: questionBoxColors.lerp(other.questionBoxColors, t),
        successBoxColors: successBoxColors.lerp(other.successBoxColors, t),
        errorBoxColors: errorBoxColors.lerp(other.errorBoxColors, t));
  }
}
