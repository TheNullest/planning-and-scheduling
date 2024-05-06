import 'package:flutter/material.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';

class CustomTaskButton extends StatelessWidget {
  final String text;

  const CustomTaskButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        child: Text(text,
            style: TextStyle(
              color: ThemeProvider.myTheme(context).textFieldForegroundColor,
            )));
  }
}
