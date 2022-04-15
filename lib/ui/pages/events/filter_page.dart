import 'package:flutter/material.dart';
import 'package:barriolympics/ui/components/top_banner.dart';
import 'package:barriolympics/ui/components/event/event_list.dart';
import 'package:barriolympics/ui/components/post/like_button.dart';
import 'package:barriolympics/ui/pages/events/events_page.dart';

import 'dart:core';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();

}


class _FilterPageState extends State<FilterPage> {
  DateTime? _dateStartTime;

  TimeOfDay? time;
  TimeOfDay? time1;
  TimeOfDay? picked;
  TimeOfDay? picked1;

  @override
  void initState(){
    super.initState();
    time = const TimeOfDay(hour:10, minute: 30);
    time1 =  TimeOfDay.fromDateTime(DateTime.now().add(Duration(minutes: 120)));
}

Future<Null> selectTime(BuildContext context) async {
  picked = await showTimePicker(
      context: context, initialTime: TimeOfDay.now()
  );
  if (picked != Null) {
    setState(() {
      time = picked;
    });
  }
}

Future<Null> selectTime1(BuildContext context) async {
  picked1 = await showTimePicker(
      context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now().add(Duration(minutes: 120)))
  );

  if (picked1 != Null) {
    setState(() {
      time1 = picked1;
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

          Column (
            children: [
              const SizedBox(height: 25),

                Padding(
                padding: const EdgeInsets.all(15),
                child: Text('Filter',
                    style: Theme.of(context).textTheme.headline6),
              ),


              Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text('Date: ', style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 10),

                    Text(_dateStartTime == null ? '' : (_dateStartTime?.day)
                        .toString(), style: const TextStyle(
                        fontWeight: FontWeight.bold
                    )),
                    Text(_dateStartTime == null ? '' : (' / ')
                        .toString(), style: const TextStyle(
                        fontWeight: FontWeight.bold
                    )),
                    Text(_dateStartTime == null ? '' : (_dateStartTime?.month)
                        .toString(), style: const TextStyle(
                        fontWeight: FontWeight.bold
                    )),
                    const Spacer(),
                    OutlinedButton(
                      onPressed: () {
                        showDatePicker(context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2030)).then((date) {
                          setState(() {
                            _dateStartTime = date!;
                          });
                        });
                      },
                      child: const Text('Pick a date for event'),

                      ),
                    const SizedBox(width: 100)
                  ]
              ),
              Row(
                children: [
                  const SizedBox(width: 10),
                  const Text('Starts after:', style: TextStyle(fontSize: 14)),
                  const SizedBox(width: 10),

                  Text('${time?.hour}:${time?.minute}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),

                  const Spacer(),
                  OutlinedButton(
                    onPressed: (){
                      selectTime(context);
                    },
                    child: const Text('Pick a starting time'),
                  ),
                  const SizedBox(width: 100),
                ]
              ),
              Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text('Ends before:', style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 10),
                    Text('${time1?.hour}:${time1?.minute}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),

                    const Spacer(),
                    OutlinedButton(
                      onPressed: (){
                        selectTime(context);
                      },
                      child: const Text('Pick an ending time'),
                    ),
                    const SizedBox(width: 100),
                  ]
              ),
              const Spacer(),
              OutlinedButton(
                  child: const Text('Apply Filters'),
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventsPage()),
                  );}),
              const SizedBox(height: 50),

            ],
          )

    );
  }
}

