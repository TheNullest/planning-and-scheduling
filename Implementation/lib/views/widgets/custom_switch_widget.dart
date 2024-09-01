import 'package:flutter/material.dart';
import 'package:zamaan/views/widgets/custom_widgets.dart';

/// It helps to switch between two constant and fixed values
class CustomSwitchWidget extends StatefulWidget {
  final bool value;
  final void Function(bool valueChanged)? onChanged;

  const CustomSwitchWidget(
      {super.key, required this.value, required this.onChanged});

  @override
  State<CustomSwitchWidget> createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return RawCustomButtonWidget(
      onTap: (ontap) => widget.onChanged?.call(!widget.value),
      child: Container(
        width: 50,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.green,
        ),
        child: Expanded(
          child: Stack(children: [
            AnimatedPositioned(
              left: widget.value ? 4 : 21,
              duration: const Duration(milliseconds: 300),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 2.5),
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.value ? Colors.white : Colors.black,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
