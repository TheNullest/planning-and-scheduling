import 'package:flutter/material.dart';

class WidgetActivitiesColorMode {
  final Color _color;
  final double _lightness;

  WidgetActivitiesColorMode({required Color color, double lightness = 0})
      : _lightness = lightness,
        _color = color;

  int get _red => _color.red;
  int get _green => _color.green;
  int get _blue => _color.blue;

  Color get onHovering => colorLightness(.9);

  Color get onTapDown => colorLightness(.8);

  Color get onLongPressStart => colorLightness(.7);

  Color get mainColor => _color;

  Color get disabled => colorLightness(.6);

  Color get costomMode => colorLightness(_lightness);

  Color colorLightness(double percentage) => Color.fromARGB(
      255,
      (_red * percentage).round(),
      (_green * percentage).round(),
      (_blue * percentage).round());

  // Color get onHovering => HSLColor.fromColor(_color).withHue(.5).toColor();

  // Color get onTapDown => HSLColor.fromColor(_color).withLightness(.3).toColor();

  // Color get onLongPressStart =>
  //     HSLColor.fromColor(_color).withLightness(.25).toColor();

  // Color get mainColor => _color;

  // Color get disabled => HSLColor.fromColor(_color).withLightness(.2).toColor();

  // Color get costomMode =>
  //     HSLColor.fromColor(_color).withAlpha(_lightness).toColor();
}
