import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/ui/pages/new_event/new_event_splash_screen.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step_basic_info.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step_loc.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step_permits.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step_publish.dart';
import 'package:flutter/material.dart';

class EditEventPage extends StatefulWidget {
  EditEventPage({Key? key, required this.event}) : super(key: key);

  Event event;

  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  int _activeStepIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle stepStyle =
        Theme.of(context).textTheme.headline5!.copyWith(height: 1.7);
    List<Step> steps = [
      NewEventStepBasicInfo.getStep(
          _activeStepIndex, stepStyle, widget.event.step1 ? StepState.complete : StepState.indexed),
      EditEventStepLoc.getStep(_activeStepIndex, stepStyle, StepState.indexed),
      EditEventStepPermits.getStep(
          _activeStepIndex, stepStyle, StepState.indexed),
      EditEventStepPublish.getStep(
          _activeStepIndex, stepStyle, StepState.indexed),
    ];

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
          title: Text((widget.event != null ? "Edit" : "New") + " event"),
        ),
        body: Stepper(
          steps: steps,
          currentStep: _activeStepIndex,
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            String continueText = 'Save';
            if (details.stepIndex == steps.length - 1) {
              continueText = "Publish";
            }
            return Row(
              children: [
                ElevatedButton(
                  onPressed: details.onStepContinue,
                  child: Text(continueText),
                ),
                if (details.stepIndex > 0) ...[
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: Text('Back'),
                  ),
                ]
              ],
            );
          },
          onStepContinue: () {
            if (_activeStepIndex < (steps.length - 1)) {
              setState(() {
                _activeStepIndex += 1;
              });
            } else {
              print('Submitted');
            }
          },
          onStepCancel: () {
            if (_activeStepIndex == 0) {
              return;
            }
            setState(() {
              _activeStepIndex -= 1;
            });
          },
          onStepTapped: (int index) {
            setState(() {
              _activeStepIndex = index;
            });
          },
        ));
  }
}
