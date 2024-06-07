import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zamaan/themes/custom_theme_extension.dart';
import 'package:zamaan/utilities/utilities.dart';

class CustomTaskButtonOptionsWidget extends StatefulWidget {
  final bool opensOptionsSection;
  final void Function()? optionsSectionClosed;
  final CustomThemeExtension myTheme;

  const CustomTaskButtonOptionsWidget(
      {super.key,
      required this.opensOptionsSection,
      this.optionsSectionClosed,
      required this.myTheme});

  @override
  State<CustomTaskButtonOptionsWidget> createState() =>
      _CustomTaskButtonOptionsWidgetState();
}

class _CustomTaskButtonOptionsWidgetState
    extends State<CustomTaskButtonOptionsWidget> {
  late bool _displayed = false;
  late double widgetHeigth;
  @override
  Widget build(BuildContext context) {
    widgetHeigth = ResponsiveHelper.screenUsableHeight(context) - 90;
    if (widgetHeigth < 500) widgetHeigth = 430;
    Timer(
        Duration(
            milliseconds: widget.opensOptionsSection && !_displayed ? 200 : 0),
        () => setState(() {
              _displayed = widget.opensOptionsSection;
            }));

    return Expanded(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: widget.opensOptionsSection ? 1 : 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(child: Text('Options Main Container')),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () => {widget.optionsSectionClosed!()},
                child: const Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.yellow,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
