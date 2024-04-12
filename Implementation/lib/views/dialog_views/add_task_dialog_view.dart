import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:zamaan/components/custom_components.dart';
import 'package:zamaan/data/data.dart';
import 'package:zamaan/views/calendar_view.dart';

class AddTaskDialogView extends StatefulWidget {
  final TextEditingController taskNameTextController;
  final TextEditingController descriptionTextController;

  const AddTaskDialogView(
      {super.key,
      required this.taskNameTextController,
      required this.descriptionTextController});

  @override
  State<AddTaskDialogView> createState() => _AddTaskDialogViewState();
}

class _AddTaskDialogViewState extends State<AddTaskDialogView> {
  @override
  Widget build(BuildContext context) {
    Jalali tempPickedDate;
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 25),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: widget.taskNameTextController,
                        hintText: 'نام کار جدید را وارد کنید',
                      ),
                      CustomTextField(
                        controller: widget.descriptionTextController,
                        hintText: 'توضیحات',
                        isExpandable: true,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      CustomNormalButton(
                        text: 'تاریخ شروع',
                        onPressed: () => showDialogBox(
                          Dialog(
                            child: CupertinoTheme(
                              data: const CupertinoThemeData(
                                textTheme: CupertinoTextThemeData(
                                  dateTimePickerTextStyle:
                                      TextStyle(fontFamily: "Dana"),
                                ),
                              ),
                              child: PCupertinoDatePicker(
                                mode: PCupertinoDatePickerMode.dateAndTime,
                                onDateTimeChanged: (Jalali dateTime) {
                                  tempPickedDate = dateTime;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomNormalButton(
                        text: 'افزودن مشارکت کننده',
                        onPressed: () => showDialogBox(Dialog(
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          insetPadding: const EdgeInsets.all(25),
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(5)),
                            child: ListView.builder(
                                itemCount: users.length,
                                itemBuilder: (context, index) {
                                  final user = users[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Text(user.firstName),
                                  );
                                }),
                          ),
                        )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomNormalButton(
                        text: 'گروه بندی',
                        onPressed: () => showDialogBox(Dialog(
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          insetPadding: const EdgeInsets.all(25),
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(5)),
                            child: ListView.builder(
                                itemCount: groups.length,
                                itemBuilder: (context, index) {
                                  final group = groups[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Text(group.groupName),
                                  );
                                }),
                          ),
                        )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomNormalButton(
                        text: 'تگ',
                        onPressed: () => showDialogBox(Dialog(
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          insetPadding: const EdgeInsets.all(25),
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(5)),
                            child: ListView.builder(
                                itemCount: tags.length,
                                itemBuilder: (context, index) {
                                  final tag = tags[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Text(tag.tagName),
                                  );
                                }),
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomNormalButton(
                  onPressed: exitDialog,
                  text: 'انصراف',
                  minWidth: 100,
                ),
                CustomNormalButton(
                  onPressed: exitDialog,
                  text: 'تایید',
                  minWidth: 100,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void exitDialog() {
    Navigator.pop(context);
    widget.taskNameTextController.clear();
  }

  void showDialogBox(Dialog dialog) =>
      showDialog(context: context, builder: (context) => dialog);
}
