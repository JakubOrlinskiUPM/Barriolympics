import 'package:barriolympics/ui/pages/events/event_filter_data.dart';
import 'package:flutter/material.dart';
import 'package:barriolympics/ui/pages/events/events_page.dart';

import 'dart:core';


class FilterPage extends StatefulWidget {
  const FilterPage({Key? key, required this.setFilters}) : super(key: key);

  final Function setFilters;

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  DateTime? _dateStartTime;

  TimeOfDay? time;
  TimeOfDay? time1;
  TimeOfDay? picked;
  TimeOfDay? picked1;

  bool? timeError;

  @override
  void initState() {
    super.initState();
  }

  Future<Null?> selectTime(BuildContext context) async {
    picked =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (picked != Null) {
      if (time1 != Null){
        setState(() {
          time = picked;
        });
      }
      else {
        // it says there is begin used a null checker on time1, but it is not going in this if statement so it is a bit weird
        if (picked!.hour > time1!.hour) {
          if (picked!.minute > time1!.minute) {
            setState(() {
              time = picked;
            });
          }
          else{
            timeError = true;
          }
        }
        else {
          timeError = true;
        }
      }
    }
  }


  Future<Null?> selectTime1(BuildContext context) async {
    picked1 =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked1 != Null) {
      setState(() {
        time1 = picked1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: Text("Filter"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Date: ', style: TextStyle(fontSize: 14)),
                    Text(
                        _dateStartTime == null
                            ? ''
                            : (_dateStartTime!.day).toString() +
                            " / " +
                            (_dateStartTime!.month).toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    OutlinedButton(
                      onPressed: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2030))
                            .then((date) {
                          setState(() {
                            _dateStartTime = date;
                          });
                        });
                      },
                      child: const Text('Pick a date for event'),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Starts after:', style: TextStyle(fontSize: 14)),
                    if (time != null) ...[
                      Text('${time?.hour}:${time?.minute}',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                    OutlinedButton(
                      onPressed: () {
                        selectTime(context);
                      },
                      child: const Text('Pick a starting time'),
                    ),
                  ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Ends before:', style: TextStyle(fontSize: 14)),
                if (time1 != null) ...[
                  Text('${time1?.hour}:${time1?.minute}',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ],
                OutlinedButton(
                  onPressed: () {
                    selectTime1(context);
                  },
                  child: const Text('Pick an ending time'),
                ),
              ]),
              if (timeError == true) ...[
                Padding(padding: EdgeInsets.all(10),
                    child: Text('The starting time is bigger than the ending time.', style: TextStyle(
                        color: Colors.red)))
              ],
              const Spacer(),

              OutlinedButton(
                  child: const Text('Apply Filters'),
                  onPressed: () {
                    // widget.setFilters(EventFilterData(startDate: _dateStartTime));

                    Navigator.pop(context);
                  }),
              const SizedBox(height: 50),
            ],
          ),
        ));
  }
}
