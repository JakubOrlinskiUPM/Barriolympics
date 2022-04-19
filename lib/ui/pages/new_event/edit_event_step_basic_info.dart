import 'package:flutter/material.dart';

class NewEventStepBasicInfo extends StatefulWidget {
  const NewEventStepBasicInfo({Key? key}) : super(key: key);

  @override
  State<NewEventStepBasicInfo> createState() => _NewEventStepBasicInfoState();

  static Step getStep(int currentStep, TextStyle stepStyle, StepState state) {
    return Step(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.info_outline,
                size: 30,
              ),
            ),
            Text(
              "Basic info",
              style: stepStyle,
            ),
          ],
        ),
        state: state,
        isActive: currentStep == 0,
        content: NewEventStepBasicInfo());
  }
}

class _NewEventStepBasicInfoState extends State<NewEventStepBasicInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(hintText: "Name"),
        ),
        TextFormField(
          decoration: InputDecoration(hintText: "Barrio"),
        ),
        TextFormField(
          decoration: InputDecoration(hintText: "Date"),
        ),
        TextFormField(
          decoration: InputDecoration(hintText: "Time"),
        ),
        TextFormField(
          decoration: InputDecoration(hintText: "Description"),
        ),
      ],
    );
  }
}
