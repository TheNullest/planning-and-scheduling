import 'package:flutter/material.dart';
import 'package:zamaan/data/data.dart';
import 'package:zamaan/routes/views_route.dart';
import 'package:zamaan/utilities/providers/providers.dart';
import 'package:zamaan/utilities/utilities.dart';
import 'package:zamaan/views/views.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => ResponsiveHelper()),
      ChangeNotifierProvider(create: (context) => ChangeTaskTileSizeProvider()),
      ChangeNotifierProvider(create: (context) => ProjectModelProvider()),
      ChangeNotifierProvider(create: (context) => HideUnhideBarsProvider()),
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
