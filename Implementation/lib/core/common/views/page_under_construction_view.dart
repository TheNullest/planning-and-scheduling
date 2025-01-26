import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zamaan/core/constants/routes.dart';
import 'package:zamaan/core/resources/media_resources.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Lottie.asset(MediaResources.Lotties.under_construction1),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(
                  context,
                  Routes.signUpStringRoute,
                ),
                child: const Text('To signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
