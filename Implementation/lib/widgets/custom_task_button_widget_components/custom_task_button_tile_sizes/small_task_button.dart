import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zamaan/themes/themes.dart';
import 'package:zamaan/widgets/custom_task_button_widget_components/custom_task_button_percentage_icon.dart';
import 'package:zamaan/widgets/custom_task_button_widget_components/custom_task_button_running_icon_widget.dart';

class SmallTaskButtonTile extends StatefulWidget {
  final bool isDisplayed;
  final bool isActivated;
  final bool canOpenOptionsSection;
  final CustomThemeExtension myTheme;
  final String taskName;
  final double donePercentage;
  final IconData icon;
  final Color iconColor;
  final Color foreground;

  const SmallTaskButtonTile(
      {super.key,
      required this.isDisplayed,
      required this.myTheme,
      required this.canOpenOptionsSection,
      required this.taskName,
      required this.foreground,
      required this.donePercentage,
      required this.icon,
      required this.iconColor,
      required this.isActivated});

  @override
  State<SmallTaskButtonTile> createState() => _SmallTaskButtonTileState();
}

class _SmallTaskButtonTileState extends State<SmallTaskButtonTile> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: widget.isDisplayed ? 200 : 50),
      curve: Curves.easeInOut,
      height: widget.isDisplayed ? 70 : 0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.myTheme.taskButtonBackgroundColor,
        border: Border(
          bottom: BorderSide(
              width: 2,
              color: !widget.canOpenOptionsSection
                  ? widget.myTheme.taskButtonBorderColor
                  : Colors.transparent),
        ),
      ),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: widget.isDisplayed ? 700 : 150),
        opacity: widget.isDisplayed ? 1 : 0,
        curve: Curves.easeIn,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          // running icon
          CustomTaskButtonRunningIconWidget(
            isActivated: widget.isActivated,
          ),

          //text
          Column(
            children: [
              // To avoid "column rendredflex overflowed" have to use *Expanded*
              // or *Flexible* widgets, the i used it in the code bellow
              Expanded(
                child: Text(widget.taskName,
                    style: TextStyle(
                      color: widget.foreground,
                      fontSize: 15,
                    )),
              ),
              Expanded(
                child: Text(
                  DateFormat('HH:mm').format(DateTime.now()),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      letterSpacing: 10,
                      fontSize: 20,
                      color: widget.foreground,
                      shadows: const [
                        Shadow(
                            color: Colors.black,
                            blurRadius: 2,
                            offset: Offset(1, 1))
                      ]),
                ),
              ),
            ],
          ),

          // Icon and percentage section
          CustomTaskButtonPercentageIcon(
            doneTime: DateTime.now(),
            donePercentage: widget.donePercentage,
            foreground: widget.foreground,
            icon: widget.icon,
            iconColor: widget.iconColor,
          ),
        ]),
      ),
    );
  }
}
