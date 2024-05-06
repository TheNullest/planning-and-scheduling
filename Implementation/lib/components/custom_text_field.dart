import 'package:flutter/material.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscureText;
  final bool isExpandable;
  final EdgeInsets? margin;
  final void Function(String)? onSubmitted;
  final bool isEnabled;

  const CustomTextField({
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
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final myTheme = ThemeProvider.myTheme(context);
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
        cursorColor: myTheme.textFieldCursorColor,
        obscureText: widget.isObscureText,
        controller: widget.controller,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        style: TextStyle(color: myTheme.textFieldForegroundColor),
        decoration: InputDecoration(
            filled: true,
            fillColor: myTheme.textFieldBackgroundColor,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: myTheme.textFieldHintColor,
              fontSize: 13,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 0, color: myTheme.textFieldEnabledBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: .7, color: myTheme.textFieldFocusedBorderColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: .7, color: Colors.red),
            ),
            enabled: widget.isEnabled),
      ),
    );
  }
}
