import 'package:flutter/material.dart';

class NewEventStepLoc extends StatefulWidget {
  const NewEventStepLoc({Key? key}) : super(key: key);

  @override
  State<NewEventStepLoc> createState() => _NewEventStepLocState();
}

class _NewEventStepLocState extends State<NewEventStepLoc> {
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
