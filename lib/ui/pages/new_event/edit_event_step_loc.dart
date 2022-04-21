import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step.dart';
import 'package:flutter/material.dart';

class EditEventStepLoc extends StatefulWidget implements EditEventStep {
  const EditEventStepLoc({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  State<EditEventStepLoc> createState() => _EditEventStepLocState();

  IconData getIcon() {
    return Icons.map;
  }

  String getTitle() {
    return "Location";
  }
}

class _EditEventStepLocState extends State<EditEventStepLoc> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(decoration: InputDecoration(hintText: "Map"),),
        TextFormField(decoration: InputDecoration(hintText: "Other stuff"),),
      ],
    );
  }
}
