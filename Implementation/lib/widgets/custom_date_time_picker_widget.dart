import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/themes/custom_theme_extension.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';
import 'package:zamaan/widgets/custom_widgets.dart';

/// Not finished
class CustomDateTimePickerWidget extends StatefulWidget {
  const CustomDateTimePickerWidget({super.key});

  @override
  State<CustomDateTimePickerWidget> createState() =>
      _CustomDateTimePickerWidgetState();
}

class _CustomDateTimePickerWidgetState
    extends State<CustomDateTimePickerWidget> {
  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension myTheme =
        Provider.of<ThemeProvider>(context).myTheme(context);
    return Row(
      children: [
        Column(children: [
          CustomIconButtonWithoutFieldWidget(
            onTap: () {},
            icon: Icons.arrow_drop_up_rounded,
            iconSize: 35,
            iconColor: Colors.white,
            child: const Icon(Icons.arrow_drop_up_rounded),
          )
        ])
      ],
    );
  }
}
