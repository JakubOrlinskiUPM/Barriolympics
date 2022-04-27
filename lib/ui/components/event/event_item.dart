import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:barriolympics/models/event.dart';

import '../../../models/event.dart';

class EventItem extends StatefulWidget {
  const EventItem({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListTile(
              horizontalTitleGap: 0,
              contentPadding: EdgeInsets.all(0),
              title: Text(widget.event.name!),
              subtitle: Text(widget.event.description!)),
          Column(
            children: [
              Row(children: [
                const Spacer(),
                const Text('Time: '),
                Text(widget.event.time!.hour.toString(),
                    style: Theme.of(context).textTheme.bodyText2),
                const Text('h-'),
                Text(widget.event.time!.hour.toString(),
                    style: Theme.of(context).textTheme.bodyText2),
                const Text('h'),
              ]),
              Row(children: [
                const Spacer(),
                const Text('Date: '),
                Text(widget.event.date!.day.toString(),
                    style: Theme.of(context).textTheme.bodyText2),
                const Text('/'),
                Text(widget.event.date!.month.toString(),
                    style: Theme.of(context).textTheme.bodyText2),
              ])
            ],
          )
        ]),
      ),
    );
  }
}
