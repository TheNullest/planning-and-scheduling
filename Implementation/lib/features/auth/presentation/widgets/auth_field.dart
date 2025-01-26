// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AuthFieldWidget extends StatelessWidget {
  const AuthFieldWidget({
    required this.textController,
    required this.hintText,
    this.isObsecured = false,
    super.key,
  });

  final TextEditingController textController;
  final bool isObsecured;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(hintText: hintText),
      obscureText: isObsecured,
      validator: (value) => value!.isEmpty ? '$hintText is missing' : null,
    );
  }
}
