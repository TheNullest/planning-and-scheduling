import 'package:flutter/material.dart';
import 'package:zamaan/themes/themes.dart';

class CustomTaskButtonMainShadowWidget extends StatefulWidget {
  final CustomThemeExtension myTheme;
  final double widgetHeight;

  const CustomTaskButtonMainShadowWidget(
      {super.key, required this.myTheme, required this.widgetHeight});

  @override
  State<CustomTaskButtonMainShadowWidget> createState() =>
      _CustomTaskButtonMainShadowWidgetState();
}

class _CustomTaskButtonMainShadowWidgetState
    extends State<CustomTaskButtonMainShadowWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      height: widget.widgetHeight,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: widget.myTheme.backgroundColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade800,
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(1, 2))
          ]),
    );
  }
}
