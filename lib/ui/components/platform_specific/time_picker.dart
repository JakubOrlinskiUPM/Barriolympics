import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  TimePicker({
    Key? key,
    required this.setTime,
    this.timeOfDay,
  }) : super(key: key);

  Function setTime;
  TimeOfDay? timeOfDay;
  TextEditingController? _timeController;

  void _showDatePicker(BuildContext context) async {
    TimeOfDay? pickedTime;
    if (Platform.isIOS && false) {
      DateTime now = DateTime.now();
      DateTime placeholder = now;

      if (timeOfDay != null) {
        placeholder = DateTime(
            now.year,
            now.month,
            now.day,
            timeOfDay!.hour,
            timeOfDay!.minute,
            now.second,
            now.millisecond,
            now.microsecond);
      }
      await showCupertinoModalPopup(
        context: context,
        builder: (_) =>
            Container(
              height: MediaQuery
                  .of(context)
                  .copyWith()
                  .size
                  .height * 0.25,
              color: Colors.white,
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: CupertinoDatePicker(
                          minimumDate: DateTime.now(),
                          initialDateTime: placeholder,
                          maximumDate: DateTime.now().add(Duration(days: 356)),
                          mode: CupertinoDatePickerMode.time,
                          onDateTimeChanged: (DateTime val) {
                            pickedTime =
                                TimeOfDay(hour: val.hour, minute: val.minute);
                          }),
                    ),
                  ],
                ),
              ),
            ),
      );
    } else {
      pickedTime = await showTimePicker(
        context: context,
        initialTime: timeOfDay != null ? timeOfDay! : TimeOfDay.now(),
      );
    }

    if (pickedTime != null) {
      String formattedDate = pickedTime.format(context);
      _timeController!.text = formattedDate;
      setTime(pickedTime);
    } else {
      print("Date is not selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    _timeController ??= TextEditingController(
      text: timeOfDay != null ? timeOfDay!.format(context) : null,
    );

    return TextFormField(
      readOnly: true,
      controller: _timeController,
      decoration: InputDecoration(hintText: "Time"),
      onTap: () {
        _showDatePicker(context);
      },
    );
  }
}
