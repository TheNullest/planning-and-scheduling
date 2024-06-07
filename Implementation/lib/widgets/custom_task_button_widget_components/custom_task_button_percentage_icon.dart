import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zamaan/utilities/utilities.dart';

class CustomTaskButtonPercentageIcon extends StatefulWidget {
  final Color foreground;
  final Color iconColor;
  final IconData icon;
  final double donePercentage;
  final DateTime doneTime;

  const CustomTaskButtonPercentageIcon(
      {super.key,
      required this.foreground,
      required this.iconColor,
      required this.icon,
      required this.donePercentage,
      required this.doneTime});
  @override
  State<CustomTaskButtonPercentageIcon> createState() =>
      _CustomTaskButtonPercentageIconState();
}

class _CustomTaskButtonPercentageIconState
    extends State<CustomTaskButtonPercentageIcon> {
  late double animateShadow = 10;
  @override
  Widget build(BuildContext context) {
    if (widget.donePercentage * 100 > 90) {
      Timer(
          const Duration(milliseconds: 500),
          () => setState(() {
                animateShadow = animateShadow == 7.0 ? 2.0 : 7.0;
              }));
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: widget.donePercentage * 100 > 90
            ? [
                BoxShadow(
                    offset: const Offset(0, -3),
                    blurRadius: animateShadow,
                    color: Colors.red,
                    spreadRadius: animateShadow / 5),
                BoxShadow(
                    offset: const Offset(0, -2),
                    blurRadius: animateShadow / 5,
                    color: Colors.green,
                    spreadRadius: animateShadow / 10),
                BoxShadow(
                    offset: const Offset(0, -1),
                    blurRadius: animateShadow / 7,
                    color: Colors.yellow,
                    spreadRadius: animateShadow / 15),
              ]
            : null,
        color: WidgetActivitiesColorMode(
                color: widget.iconColor.computeLuminance() < .1
                    ? Colors.grey.shade800
                    : widget.iconColor)
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
                height: constraints.maxHeight * widget.donePercentage,
                width: constraints.maxWidth,
                color: widget.iconColor,
              ),
            ),

            // icon, done time and percentage,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  DateFormat('HH:mm:ss').format(DateTime.now()),
                  style: TextStyle(
                      height: 0,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: widget.foreground,
                      shadows: const [
                        Shadow(
                            color: Colors.black,
                            blurRadius: 2,
                            offset: Offset(1, 1))
                      ]),
                ),
                Text(
                  ' %${(widget.donePercentage * 100).toStringAsFixed(1)}',
                  style: TextStyle(
                      height: 0,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: widget.foreground,
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
                    widget.icon,
                    color: widget.iconColor.computeLuminance() > .5
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
    );
  }
}
