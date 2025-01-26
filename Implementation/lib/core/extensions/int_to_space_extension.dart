import 'package:flutter/material.dart';

extension DoubleToSpaceExtension on num? {
  num validate({num value = 0}) => this ?? value;

  Widget get sizedBoxHeight => SizedBox(
        height: this!.toDouble(),
      );
  Widget get sizedBoxWidth => SizedBox(
        width: this!.toDouble(),
      );
}
