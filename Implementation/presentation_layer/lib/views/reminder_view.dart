import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zamaan/utilities/constants/asset_urls/lottie_constants.dart';
import 'package:zamaan/views/abstracts/asbtract_base_view.dart';

class ReminderView extends StatelessWidget implements BaseView {
  const ReminderView({super.key});
  @override
  String get viewTitle => 'یادآوری ها';

  @override
  IconData get icon => Icons.notifications_active_outlined;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Lottie.asset(LottieConstants.lottieUnderConstruction2),
    );
  }
}
