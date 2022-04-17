import 'package:barriolympics/models/event.dart';
import 'package:flutter/material.dart';

class EventFilterData {
  EventFilterData({
    this.startDate,
    this.endDate,
    this.timeFrom,
    this.timeTill,
  });

  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? timeFrom;
  TimeOfDay? timeTill;

  bool doesEventMatch(Event event) {
    bool doesMatch = true;
    if (startDate != null) {
      doesMatch = event.startTime.isBefore(startDate!);
    }
    if (endDate != null) {
      doesMatch = event.endTime.isAfter(endDate!);
    }
    // TODO add in the other checks

    return doesMatch;
  }
}