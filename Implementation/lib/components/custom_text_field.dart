import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscureText;
  final EdgeInsets? margin;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isObscureText,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
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
        cursorColor: Theme.of(context).colorScheme.tertiary,
        obscureText: isObscureText,
        controller: controller,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.primary,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontSize: 13,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                width: 0, color: Theme.of(context).colorScheme.primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                width: .7, color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
      ),
    );
  }
}
