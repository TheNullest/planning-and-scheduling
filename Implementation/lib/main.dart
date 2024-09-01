import 'package:flutter/material.dart';
import 'package:zamaan/repositories/hive_repositories.dart';
import 'package:zamaan/utilities/routes/views_route.dart';
import 'package:zamaan/utilities/providers/providers.dart';
import 'package:zamaan/utilities/utilities.dart';
import 'package:zamaan/view_models/view_modesl.dart';
import 'package:zamaan/views/views.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for Windows
  UserViewModel userVM = UserViewModel(repository: HiveUsersRepo());
  await userVM.loadEntities();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => ResponsiveHelper()),
      ChangeNotifierProvider(create: (context) => ChangeTaskTileSizeProvider()),
      ChangeNotifierProvider(create: (context) => HideUnhideBarsProvider()),
      ChangeNotifierProvider(
          create: (context) => UserViewModel(repository: HiveUsersRepo())),
      ChangeNotifierProvider(
          create: (context) =>
              MainTaskViewModel(repository: HiveMainTaskRepo())),
    ],
    child: Zamaan(
      initialRoute: userVM.entities!.isEmpty
          ? RegisterView.routeName
          : LoginView.routeName,
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



//TODO #2 Implement a versioning system within your models (e.g., an additional field) to track changes over time. 
//This allows you to differentiate between data stored under different model versions.

// Ask about git versioning from Gemini

