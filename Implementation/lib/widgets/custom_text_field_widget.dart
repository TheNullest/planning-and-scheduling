import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/themes/themes.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscureText;
  final bool isExpandable;
  final EdgeInsets? margin;
  final void Function(String)? onSubmitted;
  final bool isEnabled;

  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.isObscureText = false,
    this.isExpandable = false,
    this.isEnabled = true,
    this.margin,
    this.onSubmitted,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      final CustomThemeExtension myTheme = themeProvider.myTheme(context);
      return Container(
        margin: widget.margin,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            offset: const Offset(0, 3),
            blurRadius: 2,
            spreadRadius: 0,
          )
        ]),
        child: TextField(
          maxLines: widget.isExpandable ? null : 1,
          onSubmitted: widget.onSubmitted,
          cursorColor: myTheme.textFieldColors.textFieldCursorColor,
          obscureText: widget.isObscureText,
          controller: widget.controller,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          style: TextStyle(
              color: myTheme.textFieldColors.textFieldForegroundColor),
          decoration: InputDecoration(
              filled: true,
              fillColor: myTheme.textFieldColors.textFieldBackgroundColor,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: myTheme.textFieldColors.textFieldHintColor,
                fontSize: 13,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    width: 0,
                    color: myTheme.textFieldColors.textFieldEnabledBorderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    width: .7,
                    color: myTheme.textFieldColors.textFieldFocusedBorderColor),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: .7, color: Colors.red),
              ),
              enabled: widget.isEnabled),
        ),
      );
    });
  }
}
