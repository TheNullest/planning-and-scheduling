import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zamaan/utilities/constants/asset_urls/lottie_constants.dart';
import 'package:zamaan/views/abstracts/asbtract_base_view.dart';

/// All tasks, plans, etc. will be displayed in
/// daily, weekly, monthly and yearly view.
/// The greater the amount and number of tasks of that day, week, etc.
/// the brighter the color will be.
class CalendarView extends StatelessWidget implements BaseView {
  const CalendarView({super.key});

  @override
  String get viewTitle => 'روزشمار';

  @override
  IconData get icon => Icons.calendar_month_outlined;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Lottie.asset(LottieConstants.lottieDevelopment),
    );
  }
}
