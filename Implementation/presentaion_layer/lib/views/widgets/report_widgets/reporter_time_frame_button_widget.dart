import 'package:flutter/material.dart';
import 'package:zamaan/models/models.dart';
import 'package:zamaan/utilities/themes/themes.dart';
import 'package:zamaan/utilities/utilities.dart';
import 'package:zamaan/views/widgets/custom_widgets.dart';

class ReporterTimeFrameButtonWidget extends StatelessWidget {
  final TaskDoingTimeIntervalModel timeFrame;
  final CustomThemeExtension myTheme;
  final double? goal;
  const ReporterTimeFrameButtonWidget(
      {super.key,
      required this.timeFrame,
      required this.myTheme,
      this.goal = 0});

  @override
  Widget build(BuildContext context) {
    return RawCustomButtonWidget(
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: myTheme.environmentColors.sectionBackgroundColor,
            borderRadius: BorderRadius.circular(10)),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '0',
                    style: TextStyle(fontSize: 30, color: Colors.amber),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Icon(
                      Icons.percent,
                      color: Colors.amber,
                    ),
                  ),
                  Text(
                    'درصد از آرمان (هدف)  :  ',
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
              //When you add a VerticalDivider inside a Row or Wrap widget in Flutter,
              //it may not display correctly due to varying heights. The main reason
              //for this issue is the unrestricted height of the parent widget.
              //To resolve it, you have a couple of options :
              // Wrap your Row with IntrinsicHeight or SizedBox with a fixed hight
              VerticalDivider(
                color: myTheme.environmentColors.sectionDividerColor,
                indent: 10,
                endIndent: 10,
                width: 20,
                thickness: 1,
              ),
              Column(
                children: [
                  Text(DateTimeToString()
                      .toTimeWithSecond(dateTime: timeFrame.endAt!)),

                  //When you add a VerticalDivider inside a Row or Wrap widget in Flutter,
                  //it may not display correctly due to varying heights. The main reason
                  //for this issue is the unrestricted height of the parent widget.
                  //To resolve it, you have a couple of options :
                  // Wrap your Row with IntrinsicHeight or SizedBox with a fixed hight
                  SizedBox(
                    width: 50,
                    child: Divider(
                      color: myTheme.environmentColors.sectionBackgroundColor,
                      endIndent: 10,
                      indent: 10,
                      height: 10,
                      thickness: 1,
                    ),
                  ),
                  Text(DateTimeToString()
                      .toTimeWithSecond(dateTime: timeFrame.startAt)),
                ],
              ),
              Text(timeFrame.spentTime
                  .toString()
                  .split('.')
                  .first
                  .padLeft(8, '0')),
              const Icon(
                Icons.timelapse,
                size: 30,
                color: Colors.white,
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 30,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
