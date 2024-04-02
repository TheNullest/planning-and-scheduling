import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static String routeName = 'home-view';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('خانه'),
      ),
    );
  }
}
