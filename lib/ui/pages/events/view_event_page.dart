import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step.dart';
import 'package:barriolympics/ui/pages/new_event/new_event_splash_screen.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step_basic_info.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step_loc.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step_permits.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step_publish.dart';
import 'package:barriolympics/utils.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../models/barrio.dart';

class ViewEventPage extends StatefulWidget {
  ViewEventPage({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  State<ViewEventPage> createState() => _ViewEventPageState();
}

class _ViewEventPageState extends State<ViewEventPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _dateController = TextEditingController(
      text: widget.event.date != null
          ? DateFormat('yyyy-MM-dd').format(widget.event.date!)
          : null,
    );
    TextEditingController _timeController = TextEditingController(
      text:
          widget.event.time != null ? widget.event.time!.format(context) : null,
    );
    TextEditingController _descriptionController = TextEditingController(
      text: widget.event.description,
    );

    AppState appState = Provider.of<AppState>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.event.name!),
      ),
      body: Column(
        children: [
          SafeArea(
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                image: getImage(widget.event),
              ),
            ),
          ),
          Column(children: [
            Text(widget.event.name.toString()),
            Text(widget.event.barrio.toString()),
            //barrio??? is not in the dummy data -> ==null
            Text(widget.event.date.toString().substring(0, 10)),
            Text(widget.event.time.toString().substring(10, 15)),
            Text(widget.event.description.toString()),
          ])
        ],
      ),
    );
  }
}
