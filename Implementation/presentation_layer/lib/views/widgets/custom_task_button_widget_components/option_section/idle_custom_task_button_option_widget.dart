import 'package:flutter/material.dart';

class IdleCustomTaskButtonOptionWidget extends StatelessWidget {
  const IdleCustomTaskButtonOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Text('Idle'),
    );
  }
}
