import 'package:flutter/material.dart';

class NewEventStepPublish extends StatefulWidget {
  const NewEventStepPublish({Key? key}) : super(key: key);

  @override
  State<NewEventStepPublish> createState() => _NewEventStepPublishState();
}

class _NewEventStepPublishState extends State<NewEventStepPublish> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Good job, you're nearly there!"),
        TextFormField(decoration: InputDecoration(hintText: "Other stuff"),),
        TextButton(onPressed: () {  }, child: Text("Done"),),
      ],
    );
  }
}
