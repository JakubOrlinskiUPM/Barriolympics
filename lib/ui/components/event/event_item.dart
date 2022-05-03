import 'dart:io';
import 'dart:math';

import 'package:barriolympics/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:barriolympics/models/event.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../../models/event.dart';
import '../../../provider/app_state.dart';
import '../../pages/routing.dart';

class EventItem extends StatefulWidget {
  const EventItem({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  Widget getEventBanner(AppState state) {
    String? label = null;
    if (state.user.organisedEvents.contains(widget.event)) {
      label =
          "Your event - " + (widget.event.isPublished ? "published" : "draft");
    }
    if (state.user.attendingEvents.contains(widget.event)) {
      label = "Attending!";
    }
    if (state.user.volunteeringEvents.contains(widget.event)) {
      label = "Volunteering!";
    }

    if (label == null) {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Text(label),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    AppState state = Provider.of<AppState>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Hero(
          tag: "event-${widget.event.id}-image",
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              image: getImage(widget.event),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.35, 1],
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: OutlinedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero)),
                onPressed: () {
                  Navigator.pushNamed(context, VIEW_EVENT_PAGE,
                      arguments: {'event': widget.event});
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getEventBanner(state),
                          state.user.organisedEvents.contains(widget.event)
                              ? ElevatedButton.icon(
                                  label: Text("Edit"),
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, EDIT_EVENT_PAGE,
                                        arguments: {"event": widget.event});
                                  },
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Text(
                                  widget.event.name!,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ),
                              Card(
                                  margin: EdgeInsets.only(bottom: 6),
                                  child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            const Icon(
                                                Icons.date_range_outlined,
                                                size: 15),
                                            Text(
                                                widget.event.date!.day
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2),
                                            const Text('/'),
                                            Text(
                                                widget.event.date!.month
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2),
                                          ]),
                                        ],
                                      ))),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, right: 16, left: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                const Icon(Icons.location_on,
                                    size: 15, color: Colors.white),
                                Text(widget.event.location!.locationName,
                                    style: TextStyle(color: Colors.white)),
                              ]),
                              Row(children: [
                                Row(
                                  children: widget.event.categories
                                      .map(
                                        (category) => Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Icon(
                                              category.iconData,
                                              size: 18,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.access_time_outlined,
                                        size: 15, color: Colors.white),
                                    Text(
                                        getTimeString(widget.event.time!.hour,
                                            widget.event.time!.minute),
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ]),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
