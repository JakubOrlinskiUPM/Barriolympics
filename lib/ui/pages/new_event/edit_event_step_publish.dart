import 'package:flutter/material.dart';

class EditEventStepPublish extends StatefulWidget {
  const EditEventStepPublish({Key? key}) : super(key: key);

  @override
  State<EditEventStepPublish> createState() => _EditEventStepPublishState();

  static Step getStep(int currentStep, TextStyle stepStyle, StepState state) {
    return Step(
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.publish_outlined,
                size: 30,
              ),
            ),
            Text(
              "Publish",
              style: stepStyle,
            )
          ],
        ),
        isActive: currentStep == 3,
        content: EditEventStepPublish());
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
