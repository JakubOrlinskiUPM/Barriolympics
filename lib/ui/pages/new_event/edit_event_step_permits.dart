import 'package:flutter/material.dart';

class EditEventStepPermits extends StatefulWidget {
  const EditEventStepPermits({Key? key}) : super(key: key);

  @override
  State<EditEventStepPermits> createState() => _EditEventStepPermitsState();

  static Step getStep(int currentStep, TextStyle stepStyle, StepState state) {
    return Step(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.file_copy_outlined,
                size: 30,
              ),
            ),
            Text(
              "Permits",
              style: stepStyle,
            ),
          ],
        ),
        isActive: currentStep == 2,
        content: EditEventStepPermits()
    );
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
