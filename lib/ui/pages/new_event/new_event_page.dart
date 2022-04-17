import 'package:barriolympics/ui/pages/new_event/new_event_splash_screen.dart';
import 'package:barriolympics/ui/pages/new_event/new_event_step_basic_info.dart';
import 'package:barriolympics/ui/pages/new_event/new_event_step_loc.dart';
import 'package:barriolympics/ui/pages/new_event/new_event_step_permits.dart';
import 'package:barriolympics/ui/pages/new_event/new_event_step_publish.dart';
import 'package:flutter/material.dart';

class NewEventPage extends StatefulWidget {
  const NewEventPage({Key? key}) : super(key: key);

  @override
  State<NewEventPage> createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  bool start = false;
  int _activeStepIndex = 0;
  List<Step> steps = [
    Step(title: Text("Basic info"), content: NewEventStepBasicInfo()),
    Step(title: Text("Location & misc"), content: NewEventStepLoc()),
    Step(title: Text("Permits"), content: NewEventStepPermits()),
    Step(title: Text("Publish"), content: NewEventStepPublish()),
  ];

  void startForm() {
    setState(() {
      start = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: start
          ? Stepper(
              steps: steps,
              currentStep: _activeStepIndex,
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Row(
                  children: [
                    ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: Text('Continue to Step ${details.stepIndex + 1}'),
                    ),
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: Text('Back to Step ${details.stepIndex - 1}'),
                    ),
                  ],
                );
              },
              onStepContinue: () {
                if (_activeStepIndex < (steps.length - 1)) {
                  setState(() {
                    _activeStepIndex += 1;
                  });
                } else {
                  print('Submited');
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
            )
          : NewEventSplashScreen(onPressed: startForm),
    );
  }
}
