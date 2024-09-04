import 'package:flutter/material.dart';

class ActiveCustomTaskButtonOptionWidget extends StatelessWidget {
  const ActiveCustomTaskButtonOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Text('Active'),
    );
  }
}
