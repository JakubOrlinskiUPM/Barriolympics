import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step.dart';
import 'package:flutter/material.dart';

class EditEventStepPermits extends StatefulWidget implements EditEventStep {
  const EditEventStepPermits({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  State<EditEventStepPermits> createState() => _EditEventStepPermitsState();

  IconData getIcon() {
    return Icons.file_copy_outlined;
  }
  String getTitle() {
    return "Permits";
  }
}

class _EditEventStepPermitsState extends State<EditEventStepPermits> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("We help with this!"),
        Text("Call and message"),
        TextFormField(decoration: InputDecoration(hintText: "Permit 1"),),
        TextFormField(decoration: InputDecoration(hintText: "Permit 2"),),
      ],
    );
  }
}
