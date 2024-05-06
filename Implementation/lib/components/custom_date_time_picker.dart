import 'package:flutter/material.dart';
import 'package:zamaan/components/custom_components.dart';

class CustomDateTimePicker extends StatefulWidget {
  const CustomDateTimePicker({super.key});

  @override
  State<CustomDateTimePicker> createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(children: [
          CustomIconButtonWithoutField(
            onTap: () {},
            icon: Icons.arrow_drop_up_rounded,
            iconSize: 35,
            child: const Icon(Icons.arrow_drop_up_rounded),
          )
        ])
      ],
    );
  }
}
