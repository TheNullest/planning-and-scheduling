import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/themes/custom_theme_extension.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';

class CustomNoFieldTextButtonWidget extends StatefulWidget {
  final Function() onTap;
  final String name;

  const CustomNoFieldTextButtonWidget(
      {super.key, required this.onTap, required this.name});

  @override
  State<CustomNoFieldTextButtonWidget> createState() =>
      _CustomNoFieldTextButtonWidgetState();
}

class _CustomNoFieldTextButtonWidgetState
    extends State<CustomNoFieldTextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      final CustomThemeExtension myTheme = themeProvider.myTheme(context);
      late Color textColor = myTheme.textButtonColor;
      return InkWell(
          onTap: widget.onTap,

          // changing the text color when mouse is hover
          onHover: (isHover) => setState(() => isHover
              ? textColor = myTheme.textButtonHoveredColor
              : textColor = myTheme.textButtonColor),
          onTapDown: (tapDownDetails) {
            setState(() => textColor = myTheme.textButtonPressedColor);
          },
          child: Text(
            widget.name,
            textDirection: TextDirection.rtl,
            style: TextStyle(shadows: const [
              Shadow(color: Colors.black, offset: Offset(1, 2), blurRadius: 5)
            ], fontSize: 13, color: textColor, fontWeight: FontWeight.bold),
          ));
    });
  }
}
