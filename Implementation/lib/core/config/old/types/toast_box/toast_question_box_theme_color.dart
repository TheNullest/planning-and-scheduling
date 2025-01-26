// import 'package:flutter/material.dart';
// import 'package:zamaan/core/config/old/types/toast_box/asbtract_toast_box_theme_colors.dart';

// class ToastSuccessBoxThemeColors extends AbstracToastBoxThemeColors {
//   ToastSuccessBoxThemeColors({
//     required super.headerColor,
//     required super.titleColor,
//     required super.backgroundColor,
//     required super.foregroundColor,
//     required super.confirmButtonBackgroundColor,
//   });

//   @override
//   ToastSuccessBoxThemeColors copyWith({
//     Color? headerColor,
//     Color? titleColor,
//     Color? backgroundColor,
//     Color? foregroundColor,
//     Color? confirmButtonBackgroundColor,
//     Color? cancelButtonForegroundColor,
//   }) =>
//       ToastSuccessBoxThemeColors(
//         backgroundColor: backgroundColor ?? this.backgroundColor,
//         headerColor: headerColor ?? this.headerColor,
//         titleColor: titleColor ?? this.titleColor,
//         foregroundColor: foregroundColor ?? this.foregroundColor,
//         confirmButtonBackgroundColor:
//             confirmButtonBackgroundColor ?? this.confirmButtonBackgroundColor,
//       );

//   @override
//   ToastSuccessBoxThemeColors lerp(AbstracToastBoxThemeColors other, t) =>
//       other is! ToastSuccessBoxThemeColors
//           ? this
//           : ToastSuccessBoxThemeColors(
//               headerColor:
//                   Color.lerp(headerColor, other.headerColor, t as double),
//               titleColor: Color.lerp(titleColor, other.titleColor, t),
//               backgroundColor:
//                   Color.lerp(backgroundColor, other.backgroundColor, t),
//               foregroundColor:
//                   Color.lerp(foregroundColor, other.foregroundColor, t),
//               confirmButtonBackgroundColor: Color.lerp(
//                 confirmButtonBackgroundColor,
//                 other.confirmButtonBackgroundColor,
//                 t,
//               ),
//             );
// }
