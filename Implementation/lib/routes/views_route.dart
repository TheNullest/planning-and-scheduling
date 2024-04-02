import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zamaan/views/register_view.dart';
import 'package:zamaan/views/views.dart';

class ViewsRoute {
  static Map<String, WidgetBuilder> viewsRoute(BuildContext context) => {
        LoginView.routeName: (context) => const LoginView(),
        RegisterView.routeName: (context) => const RegisterView(),
        HomeView.routeName: (context) => const HomeView(),
      };

  static void goToSelectedView(BuildContext context, {required String view}) {
    switch (view) {
      case 'login':
        Navigator.pushNamed(context, LoginView.routeName);
        break;
      case 'register':
        Navigator.pushNamed(context, RegisterView.routeName);
        break;
      case 'home':
        Navigator.pushNamed(context, HomeView.routeName);
        break;
    }
  }
}
