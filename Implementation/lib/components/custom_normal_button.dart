import 'package:flutter/material.dart';
import 'package:zamaan/themes/custom_theme_extension.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';

class CustomNormalButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double minWidth;
  const CustomNormalButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.minWidth = double.infinity});

  @override
  Widget build(BuildContext context) {
    final myTheme = ThemeProvider.myTheme(context);
    return RawMaterialButton(
      hoverElevation: 10,
      constraints: BoxConstraints(minWidth: minWidth, minHeight: 50),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      fillColor: myTheme.buttonBackgroundColor,
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 50, color: myTheme.buttonForegroundColor),
        ),
      ),
    );
  }
}
