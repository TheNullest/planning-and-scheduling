import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/utilities/date_time_helper.dart';
import 'package:zamaan/utilities/themes/custom_theme_extension.dart';
import 'package:zamaan/utilities/extensions/int_to_space_extension.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';
import 'package:zamaan/views/widgets/custom_date_time_picker_widget_components/custom_time_picker_widget.dart';

/// Not finished
class CustomDateTimePickerWidget extends StatefulWidget {
  //TODO #1 You must consider a suitable time range to control the display and selection of the date, so that the user cannot choose outside of that time range.
  final DateTimeHelper selectedDateTime;
  final String title;
  const CustomDateTimePickerWidget(
      {super.key, required this.selectedDateTime, required this.title});

  @override
  State<CustomDateTimePickerWidget> createState() =>
      _CustomDateTimePickerWidgetState();
}

class _CustomDateTimePickerWidgetState
    extends State<CustomDateTimePickerWidget> {
  final TextEditingController yearTextController = TextEditingController();
  final TextEditingController monthTextController = TextEditingController();
  final TextEditingController dayTextController = TextEditingController();

  @override
  void dispose() {
    yearTextController.dispose();
    monthTextController.dispose();
    dayTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension myTheme =
        Provider.of<ThemeProvider>(context).myTheme(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: MaterialButton(
        highlightColor: Colors.blue,
        hoverElevation: 15,
        onPressed: () =>
            _showDateTimePickerTabs(selectedTime: widget.selectedDateTime),
        splashColor: Colors.cyanAccent,
        colorBrightness: Brightness.light,
        color: Colors.cyan,
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(widget.selectedDateTime.year.toString()),
                    Text(widget.selectedDateTime.month.toString()),
                    Text(widget.selectedDateTime.day.toString()),
                    Text(
                        '${widget.selectedDateTime.hour}:${widget.selectedDateTime.minute}'),
                  ],
                ),
              ),
              Text(widget.title),
            ],
          ),
        ),
      ),
    );
  }

  void _showDateTimePickerTabs({required DateTimeHelper selectedTime}) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: DefaultTabController(
                  length: 2,
                  initialIndex: 1,
                  child: Scaffold(
                    appBar: AppBar(
                      bottom: const TabBar(tabs: [
                        Tab(
                          text: 'تاریخ',
                        ),
                        Tab(
                          text: 'ساعت',
                        ),
                      ]),
                    ),
                    body: TabBarView(
                      children: [
                        _persianDatePicker(
                            dtViewModel: selectedTime,
                            yearTextController: yearTextController,
                            monthTextController: monthTextController,
                            dayTextController: dayTextController),
                        CustomTimePickerWidget(
                            selectedTime: selectedTime,
                            onChanged: ((changed) {
                              if (changed) setState(() {});
                            }))
                        // Center(
                        //   child: _timePicker(
                        //       hourTextController: hourTextController,
                        //       minuteTextController: minuteTextController),
                        // ),
                      ],
                    ),
                  )),
            ));
  }

  Widget _persianDatePicker(
      {required DateTimeHelper dtViewModel,
      required TextEditingController yearTextController,
      required TextEditingController monthTextController,
      required TextEditingController dayTextController}) {
    yearTextController.text = dtViewModel.year.toString();
    monthTextController.text = dtViewModel.month.toString();
    dayTextController.text = dtViewModel.day.toString();
    return Container(
      width: 200,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.black12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: yearTextController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                constraints: BoxConstraints(maxWidth: 60)),
            textAlign: TextAlign.center,
            onChanged: (value) {
              widget.selectedDateTime.year = int.parse(value);
              setState(() {});
            },
          ),
          10.0.sizedBoxWidth,
          TextField(
            controller: monthTextController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
                constraints: BoxConstraints(maxWidth: 30)),
            onChanged: (value) {
              widget.selectedDateTime.month = int.parse(value);
              setState(() {});
            },
          ),
          10.0.sizedBoxWidth,
          TextField(
            controller: dayTextController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
                constraints: BoxConstraints(maxWidth: 30)),
            onChanged: (value) {
              widget.selectedDateTime.day = int.parse(value);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
