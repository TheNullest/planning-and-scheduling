import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/utilities/themes/custom_theme_extension.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';

class CustomSectionWidget extends StatelessWidget {
  final Widget child;
  final double minHeight;

  const CustomSectionWidget(
      {super.key, required this.minHeight, required this.child});

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension myTheme =
        context.watch<ThemeProvider>().myTheme(context);

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        constraints:
            BoxConstraints(minHeight: minHeight, minWidth: double.maxFinite),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: myTheme.environmentColors.sectionBorderColor, width: 2),
          color: myTheme.environmentColors.sectionBackgroundColor,
        ),
        child: child);
  }
}
