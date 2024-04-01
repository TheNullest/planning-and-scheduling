import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/themes/theme_provider.dart';
import 'package:zamaan/views/login_view.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      // theme provider
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const Zamaan(),
  ));
}

class Zamaan extends StatelessWidget {
  const Zamaan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).themeData,
        home: const LoginView());
  }
}
