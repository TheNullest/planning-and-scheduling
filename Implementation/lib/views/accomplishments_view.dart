import 'package:flutter/material.dart';

class AccomplishmentsView extends StatefulWidget {
  const AccomplishmentsView({super.key});

  @override
  State<AccomplishmentsView> createState() => _AccomplishmentsViewState();
}

class _AccomplishmentsViewState extends State<AccomplishmentsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accomplishments View'),
      ),
    );
  }
}
