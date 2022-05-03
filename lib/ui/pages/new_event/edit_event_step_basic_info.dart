import 'dart:io';

import 'package:barriolympics/models/barrio.dart';
import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/models/event_category.dart';
import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/components/platform_specific/date_picker.dart';
import 'package:barriolympics/ui/components/platform_specific/time_picker.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step_navigation.dart';
import 'package:barriolympics/ui/components/form/upload_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class NewEventStepBasicInfo extends StatefulWidget implements EditEventStep {
  const NewEventStepBasicInfo({
    Key? key,
    required this.event,
    required this.nextStep,
    required this.previousStep,
  }) : super(key: key);

  final Event event;
  final Function nextStep;
  final Function previousStep;

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
  Barrio? barrio;
  String? name = "";
  String? description = "";
  int? volunteersNeeded = null;
  TimeOfDay? time;
  DateTime? date;
  List<EventCategory> categories = [];

  @override
  void initState() {
    super.initState();

    barrio = widget.event.barrio;
    name = widget.event.name;
    description = widget.event.description;
    volunteersNeeded = widget.event.volunteersNeeded;
    time = widget.event.time;
    date = widget.event.date;
    categories = widget.event.categories.toList();
  }

  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<Barrio>(
          value: barrio,
          items: appState.barrioList
              .map((Barrio barrio) =>
                  DropdownMenuItem(value: barrio, child: Text(barrio.name)))
              .toList(),
          onChanged: (Barrio? barrio) {
            this.barrio = barrio;
          },
          hint: Text("Barrio"),
        ),
        TextFormField(
          initialValue: this.name,
          decoration: InputDecoration(hintText: "Name"),
          onChanged: (String val) {
            this.name = val;
          },
        ),
        DatePicker(
            dateTime: date,
            setDate: (DateTime date) {
              setState(() {
                this.date = date;
              });
            }),
        TimePicker(
            timeOfDay: time,
            setTime: (TimeOfDay time) {
              setState(() {
                this.time = time;
              });
            }),
        TextFormField(
          initialValue: this.description,
          maxLines: 4,
          decoration: InputDecoration(hintText: "Description"),
          onChanged: (String val) {
            setState(() {
              this.description = val;
            });
          },
        ),
        UploadFormField(
          uploadable: widget.event,
          onChange: () {
            setState(() {});
          },
          imageOnly: true,
        ),
        TextFormField(
          initialValue: this.volunteersNeeded != null
              ? this.volunteersNeeded.toString()
              : null,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          decoration: InputDecoration(hintText: "Volunteers needed"),
          onChanged: (String val) {
            setState(() {
              this.volunteersNeeded = int.tryParse(val);
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text("Event categories:"),
        ),
        Wrap(
          spacing: 8,
          children: appState.eventCategories
              .where((cat) => !cat.isSpecial)
              .map((category) {
            bool selected = categories.contains(category);
            return FilterChip(
              labelStyle: selected
                  ? TextStyle(color: Theme.of(context).colorScheme.onPrimary)
                  : TextStyle(),
              selected: selected,
              label: Text(category.label),
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    categories.add(category);
                  } else {
                    categories.remove(category);
                  }
                });
              },
            );
          }).toList(),
        ),
        EditEventStepNavigation(
          isSaveEnabled: _isSaveEnabled(),
          previousStep: () {
            widget.previousStep();
          },
          index: 0,
          nextStep: this._saveStep,
        ),
      ],
    );
  }

  bool _isSaveEnabled() {
    return name != null &&
        name!.length > 0 &&
        date != null &&
        time != null &&
        volunteersNeeded != null &&
        categories.length > 0 &&
        widget.event.fileUrl != null;
  }

  void _saveStep() {
    widget.event.barrio = barrio;
    widget.event.name = name;
    widget.event.date = date;
    widget.event.time = time;
    widget.event.description = description;
    widget.event.volunteersNeeded = volunteersNeeded;
    widget.event.categories = categories;
    widget.nextStep();
  }
}
