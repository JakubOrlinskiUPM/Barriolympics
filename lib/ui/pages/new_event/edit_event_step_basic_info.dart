import 'package:barriolympics/models/barrio.dart';
import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class NewEventStepBasicInfo extends StatefulWidget implements EditEventStep {
  const NewEventStepBasicInfo({Key? key, required this.event})
      : super(key: key);

  final Event event;

  @override
  State<NewEventStepBasicInfo> createState() => _NewEventStepBasicInfoState();

  IconData getIcon() {
    return Icons.info_outline;
  }

  String getTitle() {
    return "General details";
  }
}

class _NewEventStepBasicInfoState extends State<NewEventStepBasicInfo> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController(
      text: widget.event.name,
    );
    TextEditingController _dateController = TextEditingController(
      text: widget.event.date != null
          ? DateFormat('yyyy-MM-dd').format(widget.event.date!)
          : null,
    );
    TextEditingController _timeController = TextEditingController(
      text:
          widget.event.time != null ? widget.event.time!.format(context) : null,
    );
    TextEditingController _descriptionController = TextEditingController(
      text: widget.event.description,
    );

    AppState appState = Provider.of<AppState>(context, listen: false);

    return Column(
      children: [
        DropdownButtonFormField<Barrio>(
          value: widget.event.barrio,
          items: appState.barrioList
              .map((Barrio barrio) => DropdownMenuItem(
                  value: barrio,
                  child: Text(barrio.name)))
              .toList(),
          onChanged: (Barrio? barrio) {
            setState(() {
              widget.event.barrio = barrio;
            });
          },
          hint: Text("Barrio"),
        ),
        TextFormField(
          controller: _nameController,
          decoration: InputDecoration(hintText: "Name"),
          onChanged: (String val) {
            widget.event.name = val;
          },
        ),
        TextFormField(
          controller: _dateController,
          decoration: InputDecoration(hintText: "Date"),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              initialDate: widget.event.date != null
                  ? widget.event.date!
                  : DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 356)),
            );

            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              _dateController.text = formattedDate;
              widget.event.date = pickedDate;
            } else {
              print("Date is not selected");
            }
          },
        ),
        TextFormField(
          controller: _timeController,
          decoration: InputDecoration(hintText: "Time"),
          onTap: () async {
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: widget.event.time != null
                  ? widget.event.time!
                  : TimeOfDay.now(),
            );

            if (pickedTime != null) {
              _timeController.text = pickedTime.format(context);
              widget.event.time = pickedTime;
            } else {
              print("Date is not selected");
            }
          },
        ),
        TextFormField(
          controller: _descriptionController,
          maxLines: 6,
          decoration: InputDecoration(hintText: "Description"),
          onChanged: (String val) {
            widget.event.description = val;
          },
        ),
      ],
    );
  }
}
