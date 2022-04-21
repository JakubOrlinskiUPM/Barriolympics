import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step.dart';
import 'package:flutter/material.dart';

class EditEventStepPublish extends StatefulWidget implements EditEventStep {
  const EditEventStepPublish({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  State<EditEventStepPublish> createState() => _EditEventStepPublishState();

  IconData getIcon() {
    return Icons.publish_outlined;
  }

  String getTitle() {
    return "Publish";
  }
}

class _EditEventStepPublishState extends State<EditEventStepPublish> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Good job, you're nearly there!"),
        TextFormField(
          decoration: InputDecoration(hintText: "Other stuff"),
        ),
        TextButton(
          onPressed: () {},
          child: Text("Done"),
        ),
      ],
    );
  }
}
