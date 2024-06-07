import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTaskButtonRunningIconWidget extends StatefulWidget {
  final bool isActivated;
  final bool isRepeated;

  const CustomTaskButtonRunningIconWidget({
    super.key,
    required this.isActivated,
    this.isRepeated = false,
  });

  @override
  State<CustomTaskButtonRunningIconWidget> createState() =>
      _CustomTaskButtonRunningIconWidgetState();
}

class _CustomTaskButtonRunningIconWidgetState
    extends State<CustomTaskButtonRunningIconWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorTween;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..repeat(reverse: true); // Repeats the animation back and forth
    _colorTween = ColorTween(begin: Colors.yellowAccent, end: Colors.green)
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
    return AnimatedBuilder(
      animation: _colorTween,
      builder: (context, child) {
        return Row(
          children: [
            SizedBox(
              width: 50,
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      widget.isActivated
                          ? Icons.rocket_launch
                          : Icons.rocket_rounded,
                      color: widget.isActivated
                          ? _colorTween.value
                          : Colors.white30,
                    ),
                  ),
                  widget.isRepeated
                      ? Positioned(
                          height: 35,
                          left: 10,
                          child: Icon(
                            size: 15,
                            Icons.repeat_outlined,
                            color: widget.isActivated
                                ? _colorTween.value
                                : Colors.white30,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            DottedLine(
              direction: Axis.vertical,
              dashGapLength: 12,
              dashLength: 4,
              dashColor:
                  widget.isActivated ? _colorTween.value! : Colors.white30,
            )
          ],
        );
      },
    );
  }
}
