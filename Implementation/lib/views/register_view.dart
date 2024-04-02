import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  static String routeName = 'register-view';

  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegisterView'),
      ),
    );
  }
}
