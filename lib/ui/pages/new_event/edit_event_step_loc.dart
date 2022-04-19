import 'package:flutter/material.dart';

class EditEventStepLoc extends StatefulWidget {
  const EditEventStepLoc({Key? key}) : super(key: key);

  @override
  State<EditEventStepLoc> createState() => _EditEventStepLocState();

  static Step getStep(int currentStep, TextStyle stepStyle, StepState state) {
    return Step(
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.map,
                size: 30,
              ),
            ),
            Text(
              "Location & misc",
              style: stepStyle,
            ),
          ],
        ),
        isActive: currentStep == 1,
        content: EditEventStepLoc()
    );
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
