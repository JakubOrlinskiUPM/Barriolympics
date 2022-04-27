import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step.dart';
import 'package:flutter/material.dart';

class EditEventStepPublish extends StatefulWidget implements EditEventStep {
  const EditEventStepPublish({
    Key? key,
    required this.event,
    required this.nextStep,
    required this.previousStep,
  }) : super(key: key);

  final Event event;
  final Function nextStep;
  final Function previousStep;

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
    return ListView(
      shrinkWrap: true,
      children: [
        Text("Good job, you're nearly there!", textAlign: TextAlign.center,),
        ListTile(
          title: Text("Preview event page"),
          trailing: TextButton.icon(
            icon: Icon(Icons.find_in_page),
            label: Text("Preview"),
            onPressed: () {},
          ),
        ),
        ListTile(
          title: Text("Preview event in a list"),
          trailing: TextButton.icon(
            icon: Icon(Icons.list_alt),
            label: Text("Preview"),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ElevatedButton(
            onPressed: _publishEvent,
            child: Text("Publish event"),
          ),
        ),
      ],
    );
  }

  void _publishEvent() {}
}
