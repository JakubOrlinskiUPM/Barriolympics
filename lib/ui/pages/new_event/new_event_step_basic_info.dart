import 'package:flutter/material.dart';

class NewEventStepBasicInfo extends StatefulWidget {
  const NewEventStepBasicInfo({Key? key}) : super(key: key);

  @override
  State<NewEventStepBasicInfo> createState() => _NewEventStepBasicInfoState();
}

class _NewEventStepBasicInfoState extends State<NewEventStepBasicInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(decoration: InputDecoration(hintText: "Name"),),
        TextFormField(decoration: InputDecoration(hintText: "Barrio"),),
        TextFormField(decoration: InputDecoration(hintText: "Date"),),
        TextFormField(decoration: InputDecoration(hintText: "Time"),),
        TextFormField(decoration: InputDecoration(hintText: "Description"),),
      ],
    );
  }
}
