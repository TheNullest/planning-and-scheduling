import 'package:flutter/material.dart';
import 'package:zamaan/utilities/utilities.dart';

class CustomTaskButtonTitleWidget extends StatefulWidget {
  final bool isActivated;
  final IconData icon;
  final String taskName;

  const CustomTaskButtonTitleWidget({
    super.key,
    required this.isActivated,
    required this.icon,
    required this.taskName,
  });

  @override
  State<CustomTaskButtonTitleWidget> createState() =>
      _CustomTaskButtonTitleWidgetState();
}

class _CustomTaskButtonTitleWidgetState
    extends State<CustomTaskButtonTitleWidget>
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //text
            Expanded(
              child: Text(widget.taskName,
                  textDirection: TextDirection.rtl,
                  maxLines: 2,
                  softWrap: true,
                  style: TextStyle(
                      color:
                          widget.isActivated ? _colorTween.value : Colors.white,
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis)),
            ),

            10.0.sizedBoxWidth,

            Icon(
              size: 35,
              widget.icon,
              color: widget.isActivated ? _colorTween.value : Colors.white,
            ),
          ],
        );
      },
    );
  }
}
