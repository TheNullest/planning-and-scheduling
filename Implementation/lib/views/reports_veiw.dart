import 'package:flutter/material.dart';
import 'package:zamaan/views/abstracts/asbtract_base_view.dart';

class ReportsView extends StatelessWidget implements BaseView {
  const ReportsView({super.key});

  static String routeName = 'reports-view';

  @override
  String get viewTitle => 'Reports';

  @override
  IconData get icon => Icons.bar_chart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(color: Colors.red),
      ),
    );
  }
}
