import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  DatePicker({
    Key? key,
    required this.setDate,
    this.dateTime,
  }) : super(key: key);

  DateTime? dateTime;
  Function setDate;
  TextEditingController? _dateController;

  void _showDatePicker(BuildContext context) async {
    DateTime? pickedDate;
    if (Platform.isIOS && false) {
      await showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          height: MediaQuery.of(context).copyWith().size.height * 0.25,
          color: Colors.white,
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: CupertinoDatePicker(
                        minimumDate: DateTime.now(),
                        initialDateTime:
                            dateTime != null ? dateTime! : DateTime.now(),
                        maximumDate: DateTime.now().add(Duration(days: 356)),
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (val) {
                          pickedDate = val;
                        }),
                  ),
                ],
          ),
            ),
        ),
      );
    } else {
      pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        initialDate: dateTime != null ? dateTime! : DateTime.now(),
        lastDate: DateTime.now().add(
          Duration(days: 356),
        ),
      );
    }

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      _dateController!.text = formattedDate;
      setDate(pickedDate);
    } else {
      print("Date is not selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    _dateController ??= TextEditingController(
      text:
          dateTime != null ? DateFormat('yyyy-MM-dd').format(dateTime!) : null,
    );

    return TextFormField(
      readOnly: true,
      controller: _dateController,
      decoration: InputDecoration(hintText: "Date"),
      onTap: () {
        _showDatePicker(context);
      },
    );
  }
}
