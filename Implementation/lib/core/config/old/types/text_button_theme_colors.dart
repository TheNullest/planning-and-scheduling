// import 'package:flutter/material.dart';

// class TextButtonThemeColors {
//   TextButtonThemeColors({
//     required this.textButtonColor,
//     required this.textButtonHoveredColor,
//     required this.textButtonPressedColor,
//   });
//   final Color textButtonColor;
//   final Color textButtonHoveredColor;
//   final Color textButtonPressedColor;

//   TextButtonThemeColors copyWith({
//     Color? textButtonColor,
//     Color? textButtonHoveredColor,
//     Color? textButtonPressedColor,
//   }) =>
//       TextButtonThemeColors(
//         textButtonColor: textButtonColor ?? this.textButtonColor,
//         textButtonHoveredColor:
//             textButtonHoveredColor ?? this.textButtonHoveredColor,
//         textButtonPressedColor:
//             textButtonPressedColor ?? this.textButtonPressedColor,
//       );

//   TextButtonThemeColors lerp(TextButtonThemeColors? other, dynamic t) =>
//       other == null
//           ? this
//           : TextButtonThemeColors(
//               textButtonColor: Color.lerp(
//                 textButtonColor,
//                 other.textButtonColor,
//                 t as double,
//               ),
//               textButtonHoveredColor: Color.lerp(
//                 textButtonHoveredColor,
//                 other.textButtonHoveredColor,
//                 t,
//               ),
//               textButtonPressedColor: Color.lerp(
//                 textButtonPressedColor,
//                 other.textButtonPressedColor,
//                 t,
//               ),
//             );
// }
