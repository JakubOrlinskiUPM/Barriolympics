import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/components/invisible_expanded.dart';
import 'package:barriolympics/ui/pages/events/event_general_details.dart';
import 'package:barriolympics/ui/pages/events/event_location_details.dart';
import 'package:barriolympics/ui/pages/events/event_signup_buttons.dart';
import 'package:barriolympics/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewEventPage extends StatefulWidget {
  const ViewEventPage({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  State<ViewEventPage> createState() => _ViewEventPageState();
}

class _ViewEventPageState extends State<ViewEventPage> {
  @override
  Widget build(BuildContext context) {
    TextStyle headingStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 20,
        );

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Consumer<AppState>(builder: (context, state, child) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                centerTitle: true,
                title: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    InvisibleExpandedHeader(
                      child: Hero(
                        tag: "event-${widget.event.id}-image",
                        child: Container(
                          decoration: BoxDecoration(
                            image: getImage(widget.event),
                          ),
                        ),
                      ),
                    ),
                    InvisibleExpandedHeader(
                      reversed: true,
                      child: SafeArea(
                        child: Center(
                            child: Text(
                          widget.event.name!,
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getFullDateString(widget.event.date!),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          widget.event.name.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(widget.event.location!.locationName,
                            style: Theme.of(context).textTheme.caption),
                        EventSignupButtons(event: widget.event),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: EventGeneralDetails(event: widget.event),
                        ),
                        Text(
                          "Description:",
                          style: headingStyle,
                        ),
                        Text(
                          widget.event.description.toString(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: EventLocationDetails(
                              event: widget.event, style: headingStyle),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
