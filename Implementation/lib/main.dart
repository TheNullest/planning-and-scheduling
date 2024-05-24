import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/data/data.dart';
import 'package:zamaan/routes/views_route.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';
import 'package:zamaan/views/views.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      // theme provider
      ChangeNotifierProvider(create: (context) => ThemeProvider()),

      // task provider
      ChangeNotifierProvider(create: (context) => MainTaskProvider())
    ],
    child: const Zamaan(),
  ));
}

class Zamaan extends StatelessWidget {
  const Zamaan({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeProvider.currentTheme(context),
              routes: ViewsRoute.viewsRoute(context),
              initialRoute: LoginView.routeName,
            ));
  }
}
