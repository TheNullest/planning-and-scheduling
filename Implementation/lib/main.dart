import 'package:flutter/material.dart';
import 'package:zamaan/data/models/user_model.dart';
import 'package:zamaan/data/repositories.dart';
import 'package:zamaan/routes/views_route.dart';
import 'package:zamaan/utilities/providers/providers.dart';
import 'package:zamaan/utilities/utilities.dart';
import 'package:zamaan/views/views.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for Windows
  final List<UserModel> users = await UsersRepo().getAll();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => ResponsiveHelper()),
      ChangeNotifierProvider(create: (context) => ChangeTaskTileSizeProvider()),
      ChangeNotifierProvider(create: (context) => HideUnhideBarsProvider()),
    ],
    child: Zamaan(
      initialRoute:
          users.isEmpty ? RegisterView.routeName : LoginView.routeName,
    ),
  ));
}

class Zamaan extends StatelessWidget {
  final String initialRoute;
  const Zamaan({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.currentTheme(context),
            routes: ViewsRoute.viewsRoute(context),
            initialRoute: initialRoute));
  }
}


//TODO Ask about git versioning from Gemini

//TODO Implement a versioning system within your models (e.g., an additional field) to track changes over time. 
//This allows you to differentiate between data stored under different model versions.