import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/models/permit.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step_navigation.dart';
import 'package:barriolympics/ui/components/form/upload_form_field.dart';
import 'package:flutter/material.dart';

class EditEventStepPermits extends StatefulWidget implements EditEventStep {
  const EditEventStepPermits({
    Key? key,
    required this.event,
    required this.nextStep,
    required this.previousStep,
  }) : super(key: key);

  final Event event;
  final Function nextStep;
  final Function previousStep;

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
  List<Permit> permits = [];

  @override
  void initState() {
    super.initState();

    permits = widget.event.permits.length > 0
        ? widget.event.permits
        : widget.event.neededPermits();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.amber),
            child: Column(
              children: [
                Text("We help with this!"),
                Text("Call and message"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.phone),
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(500),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.chat_outlined),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(500),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        ...permits.map((permit) {
          return UploadFormField(
              uploadable: permit,
              onChange: () {
                setState(() {});
              });
        }).toList(),
        EditEventStepNavigation(
          isSaveEnabled: _isSaveEnabled(),
          previousStep: () {
            widget.previousStep();
          },
          index: 1,
          nextStep: this._saveStep,
        ),
      ],
    );
  }

  bool _isSaveEnabled() {
    return permits.every((permit) => permit.fileUrl != null);
  }

  void _saveStep() {
    widget.event.permits = permits;
    widget.nextStep();
  }
}
