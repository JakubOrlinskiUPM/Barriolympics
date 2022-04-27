import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step.dart';
import 'package:barriolympics/ui/pages/new_event/new_event_splash_screen.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step_basic_info.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step_loc.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step_permits.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step_publish.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:provider/provider.dart';

class EditEventPage extends StatefulWidget {
  EditEventPage({Key? key, required this.event}) : super(key: key);

  Event event;

  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  int _activeStepIndex = 0;

  void previousStep() {
    setState(() {
      _activeStepIndex -= 1;
    });
  }

  void nextStep() {
    setState(() {
      _activeStepIndex += 1;
    });

    Provider.of<AppState>(context, listen: false).updateEvent(widget.event);
  }

  @override
  Widget build(BuildContext context) {
    List<EditEventStep> stepList = [
      NewEventStepBasicInfo(
          event: widget.event, previousStep: previousStep, nextStep: nextStep),
      EditEventStepLoc(
          event: widget.event, previousStep: previousStep, nextStep: nextStep),
      EditEventStepPermits(
          event: widget.event, previousStep: previousStep, nextStep: nextStep),
      EditEventStepPublish(
          event: widget.event, previousStep: previousStep, nextStep: nextStep),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
        title: const Text("Edit event"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            IconStepper(
              activeStepColor: Theme.of(context).primaryColor,
              activeStepBorderColor: Theme.of(context).primaryColorDark,
              stepColor: Theme.of(context).highlightColor,
              lineColor: Theme.of(context).primaryColorDark,
              previousButtonIcon: _activeStepIndex > 0
                  ? Icon(
                      Icons.arrow_back,
                      // size: 35,
                    )
                  : Icon(Icons.navigate_before, color: Colors.transparent),
              nextButtonIcon: _activeStepIndex < (stepList.length - 1)
                  ? Icon(
                      Icons.arrow_forward,
                      // size: 35,
                    )
                  : Icon(Icons.navigate_next, color: Colors.transparent),
              icons: stepList.map((step) => Icon(step.getIcon())).toList(),
              activeStep: _activeStepIndex,
              onStepReached: (index) {
                setState(() {
                  _activeStepIndex = index;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(stepList[_activeStepIndex].getTitle(),
                            style: Theme.of(context).textTheme.headline5),
                        stepList[_activeStepIndex],
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
