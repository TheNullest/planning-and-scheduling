import 'package:flutter/material.dart';
import 'package:zamaan/core/common/views/page_under_construction_view.dart';
import 'package:zamaan/core/constants/routes.dart';
import 'package:zamaan/features/auth/presentation/views/sign_in_view.dart';
import 'package:zamaan/features/auth/presentation/views/sign_up_view.dart';
import 'package:zamaan/features/settings/presentation/views/settings_view.dart';
import 'package:zamaan/features/task/presentation/views/main_task_view.dart';

/// Generates the route based on the given [RouteSettings].
/// This method handles route navigation by matching the route name
/// to the corresponding view, and returning a [PageRouteBuilder] for each view.
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // Route for the sign-up view
    case Routes.signUpStringRoute:
      return _pageBuilder(const SignUpView(), settings: settings);

    // Route for the sign-in view
    case Routes.signInStringRoute:
      return _pageBuilder(const SignInView(), settings: settings);

    // Route for the settings view
    case Routes.settingsStringRoute:
      return _pageBuilder(const SettingsView(), settings: settings);

    // Route for the main task view
    case Routes.mainTaskStringRoute:
      return _pageBuilder(const MaintTaskView(), settings: settings);

    // Default route for views under construction
    default:
      return _pageBuilder(
        const PageUnderConstruction(),
        settings: settings,
      );
  }
}

/// Helper method to create a [PageRouteBuilder] with a fade transition.
/// This method constructs a route with a fade transition animation.
///
/// [page] is a function that returns the widget to be displayed.
/// [settings] contains the settings for the route, including the route name.
PageRouteBuilder<dynamic> _pageBuilder(
  Widget page, {
  required RouteSettings settings,
}) =>
    PageRouteBuilder(
      settings: settings,
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      pageBuilder: (context, _, __) => page,
    );
