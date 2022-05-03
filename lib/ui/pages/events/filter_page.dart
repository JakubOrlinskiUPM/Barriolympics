import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/pages/events/event_filter_data.dart';
import 'package:flutter/material.dart';
import 'package:barriolympics/ui/pages/events/events_page.dart';

import 'dart:core';

import 'package:provider/provider.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key, required this.setFilters}) : super(key: key);

  final Function setFilters;

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  DateTime? _dateStartTime;

  TimeOfDay? timeFrom;
  TimeOfDay? timeTill;
  TimeOfDay? picked;

  bool? timeError;

  @override
  void initState() {
    super.initState();
  }

  void showErrorMessage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Incorrect time selection"),
            content: Text("Please change the time where the starting time comes before the ending time."),
            actionsAlignment: MainAxisAlignment.end,
            actionsPadding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 20.0),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Okay"),
              ),
            ],
          );
        });
  }

  Future<Null?> selectTimeFrom(BuildContext context) async {
    picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      setState(() {
        timeFrom = picked;
      });
      if (timeTill != null) {
        if (picked!.hour > timeTill!.hour &&
            picked!.minute > timeTill!.minute) {
          setState(() {
            timeTill = null;
          });
          // showErrorMessage();
        }
      }
    }
  }

  Future<Null?> selectTimeTill(BuildContext context) async {
    picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      if (timeFrom != null) {
        if (picked!.hour < timeFrom!.hour ||
            (picked!.hour == timeFrom!.hour && picked!.minute > timeFrom!.minute)) {
          showErrorMessage();
        } else {
          setState(() {
            timeTill = picked;
          });
        }
      } else {
        setState(() {
          timeTill = picked;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    AppState state =
    Provider.of<AppState>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: Text("Filter"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
              Opacity(
                opacity: 0.2,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text('Starts after:', style: TextStyle(fontSize: 14)),
                  if (timeFrom != null) ...[
                    Text('${timeFrom?.hour}:${timeFrom?.minute}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                  OutlinedButton(
                    onPressed: null,
                    // onPressed: () {
                    //   selectTimeFrom(context);
                    // },
                    child: const Text('Pick a starting time'),
                  ),
                ]),
              ),
              Opacity(
                opacity: 0.2,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text('Ends before:', style: TextStyle(fontSize: 14)),
                  if (timeTill != null) ...[
                    Text('${timeTill?.hour}:${timeTill?.minute}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                  OutlinedButton(
                    onPressed: null,
                    // onPressed: () {
                    //   selectTimeTill(context);
                    // },
                    child: const Text('Pick an ending time'),
                  ),
                ]),
              ),
              if (timeError == true) ...[
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        'The starting time is bigger than the ending time.',
                        style: TextStyle(color: Colors.red)))
              ],
              const Spacer(),
              ElevatedButton(
                  child: const Text('Apply Filters'),
                  onPressed: () {
                    widget.setFilters(EventFilterData(startDate: _dateStartTime, user: state.user));

                    Navigator.pop(context);
                  }),
              const SizedBox(height: 50),
            ],
          ),
        ));
  }
}
