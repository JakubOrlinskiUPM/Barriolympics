import 'package:flutter/material.dart';

class NewEventStepPermits extends StatefulWidget {
  const NewEventStepPermits({Key? key}) : super(key: key);

  @override
  State<NewEventStepPermits> createState() => _NewEventStepPermitsState();
}

class _NewEventStepPermitsState extends State<NewEventStepPermits> {
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
