import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zamaan/views/views.dart';

class ViewsRoute {
  static Map<String, WidgetBuilder> viewsRoute(BuildContext context) => {
        LoginView.routeName: (context) => const LoginView(),
        RegisterView.routeName: (context) => const RegisterView(),
        MainView.routeName: (context) => const MainView(),
        SettingsView.routeName: (context) => const SettingsView(),
        ActiveTasksView.routeName: (context) => const ActiveTasksView(),
        ReportsView.routeName: (context) => const ReportsView(),
      };

  static void goToSelectedView(BuildContext context, {required String view}) {
    switch (view) {
      case 'login':
        Navigator.pushNamed(context, LoginView.routeName);
        break;
      case 'register':
        Navigator.pushNamed(context, RegisterView.routeName);
        break;
      case 'main':
        Navigator.pushNamed(context, MainView.routeName);
        break;
      case 'settings':
        Navigator.pushNamed(context, SettingsView.routeName);
        break;
      case 'active-tasks':
        Navigator.pushNamed(context, ActiveTasksView.routeName);
        break;
      case 'reports':
        Navigator.pushNamed(context, ReportsView.routeName);
        break;
    }
  }
}
