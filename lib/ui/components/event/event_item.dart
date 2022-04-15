import 'dart:ffi';


import 'package:barriolympics/ui/components/post/comment_button.dart';
import 'package:barriolympics/ui/components/post/comment_modal.dart';
import 'package:barriolympics/ui/components/post/share_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:barriolympics/ui/components/post/like_button.dart';
import 'package:barriolympics/ui/components/user_icon.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ListTile(
          horizontalTitleGap: 0,
          contentPadding: EdgeInsets.all(0),
          title: Text(widget.event.name),
            subtitle: Text(widget.event.description)

          ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.event.imageUrl.length,
                  itemBuilder: (context, index) {
                    return Image.network(widget.event.imageUrl);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Padding(padding: EdgeInsets.all(6));
                  },
                ),
              ),
            ),
            Column(
              children: [

                Row(
                    children: [
                      const Spacer(),
                      const Text('Time: '),
                      Text(widget.event.startTime.hour.toString(),
                          style: Theme.of(context).textTheme.bodyText2),
                      const Text('h-'),

                      Text(widget.event.startTime.hour.toString(),
                          style: Theme.of(context).textTheme.bodyText2),
                      const Text('h'),
                    ]),
                Row(
                    children: [
                      const Spacer(),
                      const Text('Date: '),
                      Text(widget.event.startTime.day.toString(),
                          style: Theme.of(context).textTheme.bodyText2),
                      const Text('/'),
                      Text(widget.event.startTime.month.toString(),
                          style: Theme.of(context).textTheme.bodyText2),
                    ])
              ],
            )



          ]
        ),
        ),
      );
  }
}
