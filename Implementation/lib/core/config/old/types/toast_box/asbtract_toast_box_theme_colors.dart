import 'package:flutter/material.dart';

abstract class AbstracToastBoxThemeColors {
  AbstracToastBoxThemeColors({
    required this.headerColor,
    required this.titleColor,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.confirmButtonBackgroundColor,
    this.cancelButtonForegroundColor,
  });
  final Color headerColor;
  final Color titleColor;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color confirmButtonBackgroundColor;
  final Color? cancelButtonForegroundColor;

  AbstracToastBoxThemeColors copyWith({
    Color? headerColor,
    Color? titleColor,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? confirmButtonBackgroundColor,
    Color? cancelButtonForegroundColor,
  });

  AbstracToastBoxThemeColors lerp(
    AbstracToastBoxThemeColors other,
    dynamic t,
  );
}
