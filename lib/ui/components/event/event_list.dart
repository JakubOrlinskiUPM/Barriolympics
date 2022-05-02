import 'package:barriolympics/ui/pages/events/event_filter_data.dart';
import 'package:flutter/material.dart';
import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/ui/components/event/event_item.dart';

import 'event_item.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key, required this.events, required this.filters})
      : super(key: key);

  final List<Event> events;
  final EventFilterData filters;

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    List<Event> eventsToShow = widget.events
        .where((event) => widget.filters.doesEventMatch(event))
        .toList();

    return Container(
      child: eventsToShow.length > 0
          ? SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return EventItem(event: eventsToShow[index]);
                },
                childCount: eventsToShow.length,
              ),
            )
          : SliverToBoxAdapter(
              child: Center(
                child: Text("No matching events"),
              ),
            ),
    );
  }
}
