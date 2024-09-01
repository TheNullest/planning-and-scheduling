import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zamaan/models/models.dart';
import 'package:zamaan/utilities/utilities.dart';

class CustomTaskButtonPercentageIcon extends StatefulWidget {
  final Color foreground;
  final Color taskColor;
  final IconData icon;
  final double donePercentage;
  final GoalModel goal;
  final Duration spentTime;

  const CustomTaskButtonPercentageIcon(
      {super.key,
      required this.foreground,
      required this.taskColor,
      required this.icon,
      required this.donePercentage,
      required this.spentTime,
      required this.goal});
  @override
  State<CustomTaskButtonPercentageIcon> createState() =>
      _CustomTaskButtonPercentageIconState();
}

class _CustomTaskButtonPercentageIconState
    extends State<CustomTaskButtonPercentageIcon> {
  late double animateShadow = 10;
  @override
  Widget build(BuildContext context) {
    final DevicePlatform device =
        ResponsiveHelper.currentDevicePlatform(context);
    if (widget.donePercentage * 100 > 90) {
      Timer(
          const Duration(milliseconds: 500),
          () => setState(() {
                animateShadow = animateShadow == 7.0 ? 2.0 : 7.0;
              }));
    }
    return Container(
      width: 50,
      height: 50,
      color: Colors.amber,
    );
    // Main Container and Golden Glow
    // return AnimatedContainer(
    //   duration: const Duration(milliseconds: 200),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10),
    //     boxShadow: widget.donePercentage * 100 > 90
    //         ? [
    //             BoxShadow(
    //                 offset: const Offset(0, -3),
    //                 blurRadius: animateShadow,
    //                 color: Colors.red,
    //                 spreadRadius: animateShadow / 5),
    //             BoxShadow(
    //                 offset: const Offset(0, -2),
    //                 blurRadius: animateShadow / 5,
    //                 color: Colors.green,
    //                 spreadRadius: animateShadow / 10),
    //             BoxShadow(
    //                 offset: const Offset(0, -1),
    //                 blurRadius: animateShadow / 7,
    //                 color: Colors.yellow,
    //                 spreadRadius: animateShadow / 15),
    //           ]
    //         : null,
    //     color: WidgetActivitiesColorMode(
    //             color: widget.taskColor.computeLuminance() < .1
    //                 ? Colors.grey.shade800
    //                 : widget.taskColor)
    //         .disabled,
    //   ),
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: LayoutBuilder(
    //       builder: (context, constraints) => Stack(children: [
    //         // Percentage color container
    //         Align(
    //           alignment: Alignment.bottomCenter,
    //           child: Container(
    //             height: constraints.maxHeight * widget.donePercentage,
    //             color: widget.taskColor,
    //           ),
    //         ),

    //         // spent and remaining times and percentage,
    //         Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    //           // Percentage text
    //           Text(
    //             ' ${(widget.donePercentage * 100).toStringAsFixed(1)}%',
    //             style: TextStyle(
    //                 fontSize: device == DevicePlatform.desktop ? 25 : 35,
    //                 fontWeight: FontWeight.bold,
    //                 color: widget.foreground,
    //                 shadows: const [
    //                   Shadow(
    //                       color: Colors.black,
    //                       blurRadius: 2,
    //                       offset: Offset(1, 1))
    //                 ]),
    //           ),

    //           // spent and remaining times
    //           Column(
    //             mainAxisAlignment: widget.goal.custom
    //                 ? MainAxisAlignment.spaceEvenly
    //                 : MainAxisAlignment.center,
    //             children: [
    //               // Time spent
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text(
    //                     DateTimeToString().durationToTimeWithSecond(
    //                         duration: widget.spentTime),
    //                     style: TextStyle(
    //                         height: 1,
    //                         fontSize:
    //                             device == DevicePlatform.desktop ? 12 : 15,
    //                         fontWeight: FontWeight.bold,
    //                         color: widget.foreground,
    //                         shadows: const [
    //                           Shadow(
    //                               color: Colors.black,
    //                               blurRadius: 2,
    //                               offset: Offset(1, 1))
    //                         ]),
    //                   ),
    //                   Text(
    //                     'گذرانده :  ',
    //                     textDirection: TextDirection.rtl,
    //                     style: TextStyle(
    //                         height: 1,
    //                         fontSize:
    //                             device == DevicePlatform.desktop ? 12 : 15,
    //                         color: widget.foreground,
    //                         shadows: const [
    //                           Shadow(
    //                               color: Colors.black,
    //                               blurRadius: 2,
    //                               offset: Offset(1, 1))
    //                         ]),
    //                   ),
    //                 ],
    //               ),

    //               // Remaining time
    //               widget.goal.custom
    //                   ? Row(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: [
    //                         Text(
    //                           '${widget.goal.perDay - widget.spentTime.inMilliseconds}',
    //                           style: TextStyle(
    //                               height: 1,
    //                               fontSize: device == DevicePlatform.desktop
    //                                   ? 12
    //                                   : 15,
    //                               fontWeight: FontWeight.bold,
    //                               color: widget.foreground,
    //                               shadows: const [
    //                                 Shadow(
    //                                     color: Colors.black,
    //                                     blurRadius: 2,
    //                                     offset: Offset(1, 1))
    //                               ]),
    //                         ),
    //                         Text(
    //                           'مانده    :  ',
    //                           textDirection: TextDirection.rtl,
    //                           style: TextStyle(
    //                               height: 1.5,
    //                               fontSize: device == DevicePlatform.desktop
    //                                   ? 12
    //                                   : 15,
    //                               color: widget.foreground,
    //                               shadows: const [
    //                                 Shadow(
    //                                     color: Colors.black,
    //                                     blurRadius: 2,
    //                                     offset: Offset(1, 1))
    //                               ]),
    //                         ),
    //                       ],
    //                     )
    //                   : const SizedBox.shrink()
    //             ],
    //           ),
    //         ]),
    //       ]),
    //     ),
    //   ),
    // );
  }
}
