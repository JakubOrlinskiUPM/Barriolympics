import 'dart:io';
import 'dart:math';

import 'package:barriolympics/models/event.dart';
import 'package:flutter/material.dart';

getRandChoice(List list) {
  return list[Random().nextInt(list.length)];
}

getRandPoints() {
  return Random().nextInt(1000000);
}

getRandSublist(List list) {
  int index = Random().nextInt(list.length - 1);
  return list.sublist(index, list.length - 1);
}

DateTime getRandDate([int? seed]) {
  return DateTime.now().subtract(Duration(
    hours: Random(seed).nextInt(15),
    minutes: Random(seed).nextInt(60),
  ));
}

String formatDate(DateTime dt) {
  String res = "";
  Duration diff = DateTime.now().difference(dt);

  if (diff.inHours > 0) {
    String hour = " hour";
    if (diff.inHours > 1) {
      hour += "s";
    }
    res = diff.inHours.toString() + hour + " ago";
  } else if (diff.inMinutes > 0) {
    String minute = " hour";
    if (diff.inHours > 1) {
      minute += "s";
    }
    res = diff.inMinutes.toString() + minute + " ago";
  } else {
    res = "Just now";
  }

  return res;
}

List getOrderedListByDate(List list) {
  return list.toList()
    ..sort((c1, c2) {
      return c1.timePosted.isBefore(c2.timePosted) ? 1 : -1;
    });
}

getArgument(RouteSettings route, String key) {
  final args = route.arguments;
  dynamic res = args != null ? (args as Map)[key] : null;
  return res;
}

DecorationImage? getImage(Event event) {
  if (event.fileUrl != null) {
    if (event.fileUrl!.contains("upm.hcid.barriolympics")) {
      return DecorationImage(
        fit: BoxFit.cover,
        image: FileImage(File(event.fileUrl!), scale: 5),
      );
    } else {
      return DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(
          event.fileUrl!,
        ),
      );
    }
  }
}

String getDateRangeLabel(DateTime dt1, DateTime? dt2) {
  String res = "";
  res = dt1.day.toString();
  if (dt2 != null) {
    String secondDate = "-" + dt2.day.toString() + "/" + dt2.month.toString();
    if (dt1.month == dt2.month) {
      res += secondDate;
    } else {
      res += "/" + dt1.month.toString();
      res += secondDate;
    }
  } else {
    res += "/" + dt1.month.toString();
  }

  return res;
}

String getTimeRangeLabel(TimeOfDay tod1, TimeOfDay? tod2) {
  String res = "";

  res = tod1.hour.toString() + "h";

  if (tod2 != null) {
    res += " - " + tod2.hour.toString() + "h";
  } else {
    res += " - 24h";
  }

  return res;
}

List<String> weekdays = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday",
];

String getFullDateString(DateTime dateTime) {
  String res = "";

  res += weekdays[dateTime.weekday - 1] + ", ";
  res += "${dateTime.day} / ${dateTime.month} / ${dateTime.year} ";
  res += "at ${dateTime.hour}:${dateTime.minute}";

  return res;
}

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}