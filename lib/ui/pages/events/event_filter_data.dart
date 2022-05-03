import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/models/event_category.dart';
import 'package:barriolympics/models/user.dart';
import 'package:barriolympics/ui/components/event/chip_list.dart';
import 'package:barriolympics/utils.dart';
import 'package:flutter/material.dart';

class EventFilterData {
  EventFilterData(
      {required this.user,
      this.startDate,
      this.endDate,
      this.timeFrom,
      this.timeTill,
      this.isOwn,
      this.isAttending,
      this.isVolunteering,
      this.categories = const []});

  User user;
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? timeFrom;
  TimeOfDay? timeTill;
  List<EventCategory> categories;
  bool? isOwn;
  bool? isAttending;
  bool? isVolunteering;

  List<FilteringChip> getFilterChips() {
    List<FilteringChip> res = [];
    if (startDate != null) {
      res.add(
        FilteringChip(
          icon: Icons.event,
          label: getDateRangeLabel(startDate!, endDate),
          isFilter: true,
          selected: true,
        ),
      );
    }
    if (timeFrom != null) {
      res.add(
        FilteringChip(
          icon: Icons.timer,
          label: getTimeRangeLabel(timeFrom!, timeTill),
          isFilter: true,
          selected: true,
        ),
      );
    }
    return res;
  }

  bool doesEventMatch(Event event) {
    bool doesMatch = true;
    if (startDate != null) {
      doesMatch = event.date!.day == startDate!.day &&
          event.date!.month == startDate!.month &&
          event.date!.year == startDate!.year;
    }

    if (isOwn != null) {
      doesMatch = event.organiser.id == user.id;
    }
    if (isAttending != null) {
      doesMatch = user.attendingEvents.contains(event);
    }
    if (isVolunteering != null) {
      doesMatch = user.volunteeringEvents.contains(event);
    }

    if (categories.length > 0) {
      doesMatch =
          event.categories.any((category) => categories.contains(category));
    }

    // TODO add in the other checks

    return doesMatch;
  }
}
