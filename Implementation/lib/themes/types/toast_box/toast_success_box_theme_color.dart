import 'package:flutter/material.dart';
import 'package:zamaan/themes/types/toast_box/asbtract_toast_box_theme_colors.dart';

class ToastQuestionBoxThemeColors extends AbstracToastBoxThemeColors {
  ToastQuestionBoxThemeColors(
      {required super.headerColor,
      required super.titleColor,
      required super.backgroundColor,
      required super.foregroundColor,
      required super.confirmButtonBackgroundColor,
      required super.cancelButtonForegroundColor});

  @override
  ToastQuestionBoxThemeColors copyWith({
    Color? headerColor,
    Color? titleColor,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? confirmButtonBackgroundColor,
    Color? cancelButtonForegroundColor,
  }) =>
      ToastQuestionBoxThemeColors(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        headerColor: headerColor ?? this.headerColor,
        titleColor: titleColor ?? this.titleColor,
        foregroundColor: foregroundColor ?? this.foregroundColor,
        confirmButtonBackgroundColor:
            confirmButtonBackgroundColor ?? this.confirmButtonBackgroundColor,
        cancelButtonForegroundColor:
            cancelButtonForegroundColor ?? this.cancelButtonForegroundColor,
      );

  @override
  ToastQuestionBoxThemeColors lerp(AbstracToastBoxThemeColors other, t) =>
      other is! ToastQuestionBoxThemeColors
          ? this
          : ToastQuestionBoxThemeColors(
              headerColor: Color.lerp(headerColor, other.headerColor, t)!,
              titleColor: Color.lerp(titleColor, other.titleColor, t)!,
              backgroundColor:
                  Color.lerp(backgroundColor, other.backgroundColor, t)!,
              foregroundColor:
                  Color.lerp(foregroundColor, other.foregroundColor, t)!,
              confirmButtonBackgroundColor: Color.lerp(
                  confirmButtonBackgroundColor,
                  other.confirmButtonBackgroundColor,
                  t)!,
              cancelButtonForegroundColor: Color.lerp(
                  cancelButtonForegroundColor,
                  other.cancelButtonForegroundColor,
                  t)!,
            );
}
