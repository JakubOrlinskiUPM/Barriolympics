import 'dart:io';

import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/models/permit.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step_navigation.dart';
import 'package:barriolympics/ui/components/form/upload_form_field.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
  final String phoneNumber = "123456789";

  @override
  void initState() {
    super.initState();

    permits = widget.event.permits.length > 0
        ? widget.event.permits
        : widget.event.neededPermits();
  }

  String messageUrl() {
    if (Platform.isAndroid) {
      return "https://wa.me/$phoneNumber/"; // new line
    } else {
      return "https://api.whatsapp.com/send?phone=$phoneNumber"; // new line
    }
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
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Text("We help with this!"),
                Text("Call and message"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: IconButton(
                          icon: Icon(Icons.phone),
                          onPressed: () {
                            launchUrlString("tel://$phoneNumber");
                          },
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(500),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: IconButton(
                          icon: Icon(Icons.chat_outlined),
                          onPressed: () {
                            launchUrlString(messageUrl());
                          },
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(500),
                          ),
                        ),
                      ),
                    ],
                  ),
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
