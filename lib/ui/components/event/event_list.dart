import 'package:flutter/material.dart';
import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/provider/dummy_data.dart';
import 'package:barriolympics/ui/components/event/event_item.dart';
import 'package:provider/provider.dart';

import '../../../provider/app_state.dart';
import 'event_item.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  get event => null;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, widget) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              Event event = state.barrio.events[index];
              return EventItem(event: event);
            },
            childCount: state.barrio.events.length,
          ),
        );
      },
    );
  }
}
