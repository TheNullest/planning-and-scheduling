import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/themes/themes.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';

class CustomNormalButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double minWidth;
  const CustomNormalButtonWidget(
      {super.key,
      required this.onPressed,
      required this.text,
      this.minWidth = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      final CustomThemeExtension myTheme = themeProvider.myTheme(context);
      return RawMaterialButton(
        hoverElevation: 10,
        constraints: BoxConstraints(minWidth: minWidth, minHeight: 50),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: myTheme.buttonColors.buttonBackgroundColor,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: myTheme.buttonColors.buttonForegroundColor,
            ),
          ),
        ),
      );
    });
  }
}
