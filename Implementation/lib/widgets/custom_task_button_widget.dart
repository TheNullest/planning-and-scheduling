import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:zamaan/data/enums.dart';
import 'package:zamaan/model/main_task_model.dart';
import 'package:zamaan/themes/custom_theme_extension.dart';
import 'package:zamaan/utilities/widget_activities_color_mode.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';
import 'package:zamaan/widgets/custom_widgets.dart';

class CustomTaskButtonWidget extends StatefulWidget {
  final MainTaskModel task;
  final double donePercentage;
  final bool displaySettings;

  const CustomTaskButtonWidget(
      {super.key,
      required this.task,
      required this.donePercentage,
      this.displaySettings = false});

  @override
  State<CustomTaskButtonWidget> createState() => _CustomTaskButtonWidgetState();
}

class _CustomTaskButtonWidgetState extends State<CustomTaskButtonWidget>
    with SingleTickerProviderStateMixin {
  late CustomThemeExtension myTheme =
      Provider.of<ThemeProvider>(context).myTheme(context);

  late Color backgroundColor = myTheme.taskButtonBackgroundColor;
  late Color foreground = myTheme.taskButtonForegroundColor;
  late bool isActivated = false;

  late MouseCursor cursor = SystemMouseCursors.click;

  late ButtonStates buttonState = ButtonStates.exited;

  late AnimationController _animationController;
  late Animation<Color?> _colorTween;
  late bool displaySettings = false;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat(reverse: true); // Repeats the animation back and forth
    _colorTween = ColorTween(begin: Colors.yellow, end: Colors.green)
        .animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    myTheme = Provider.of<ThemeProvider>(context).myTheme(context);
    stateUpdater(buttonState);
    return RawCustomButtonWidget(
      onHover: (onHovering) {
        if (!isActivated) stateUpdater(ButtonStates.hoverd);
      },
      onExit: (onExit) {
        if (!isActivated) stateUpdater(ButtonStates.exited);
      },
      onTapDown: (onTapDown) {
        if (!isActivated) {
          isActivated = true;
          stateUpdater(ButtonStates.tapDown);
        }
      },
      onTapUp: (onTapUp) {
        stateUpdater(ButtonStates.tapUp);
      },
      onLongPressStart: (onLongPressed) {
        stateUpdater(ButtonStates.longPressStart);
      },
      cursor: cursor,
      child: Stack(children: [
        // main shadow
        AnimatedContainer(
          duration: const Duration(microseconds: 300),
          curve: Curves.easeInOut,
          height: displaySettings ? 200 : 70,
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: backgroundColor,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black38,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(1, 2))
              ]),
        ),

        //main container
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 50),
            curve: Curves.easeIn,
            height: widget.displaySettings ? 200 : 70,
            color: backgroundColor,
            child: Row(children: [
              // running icon
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: AnimatedBuilder(
                      animation: _colorTween,
                      builder: (context, child) {
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(
                                isActivated
                                    ? Icons.rocket_launch
                                    : Icons.rocket_rounded,
                                color: isActivated
                                    ? _colorTween.value
                                    : Colors.white30,
                              ),
                            ),
                            DottedLine(
                              direction: Axis.vertical,
                              dashGapLength: 12,
                              dashLength: 4,
                              dashColor: isActivated
                                  ? _colorTween.value!
                                  : Colors.white30,
                            )
                          ],
                        );
                      })),

              //text
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  DateFormat('HH:mm:ss').format(DateTime.now()),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 25,
                      color: foreground,
                      shadows: const [
                        Shadow(
                            color: Colors.black,
                            blurRadius: 2,
                            offset: Offset(1, 1))
                      ]),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(child: SizedBox.shrink()),
                    Text(widget.task.mainTaskName,
                        style: TextStyle(
                            color: foreground, fontWeight: FontWeight.bold)),

                    // Icon and percentage section
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: WidgetActivitiesColorMode(
                                color: widget.task.color.computeLuminance() < .1
                                    ? Colors.grey.shade800
                                    : widget.task.color)
                            .disabled,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: LayoutBuilder(
                          builder: (context, constraints) => Stack(children: [
                            // Percentage color container
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: constraints.maxHeight *
                                    widget.donePercentage,
                                width: constraints.maxWidth,
                                color: widget.task.color,
                              ),
                            ),

                            // icon
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  ' %${(widget.donePercentage * 100).toStringAsFixed(1)}',
                                  style: TextStyle(
                                      height: 0,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: foreground,
                                      shadows: const [
                                        Shadow(
                                            color: Colors.black,
                                            blurRadius: 2,
                                            offset: Offset(1, 1))
                                      ]),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    widget.task.icon,
                                    color:
                                        widget.task.color.computeLuminance() >
                                                .5
                                            ? Colors.black
                                            : Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }

  void stateUpdater(ButtonStates state) => setState(() {
        buttonState = state;
        switch (state) {
          case ButtonStates.exited:
            backgroundColor = myTheme.taskButtonBackgroundColor;
          case ButtonStates.hoverd:
            backgroundColor = myTheme.taskButtonHoverdBackgroundColor;
          case ButtonStates.tapDown:
            {
              isActivated = true;
              cursor = SystemMouseCursors.basic;
              backgroundColor = myTheme.taskButtonActivatedBackgroundColor;
            }
          case ButtonStates.longPressStart:
            {
              displaySettings = true;
            }
          default:
        }
      });
}
