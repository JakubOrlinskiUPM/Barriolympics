import 'dart:math';

import 'package:flutter/material.dart';


getRandChoice(List list) {
  return list[Random().nextInt(list.length)];
}

getRandPoints() {
  return Random().nextInt(1000000);
}

getRandSublist(List list) {
  int index = Random().nextInt(list.length-1);
  return list.sublist(index, list.length-1);
}

DateTime getRandDate() {
  return DateTime.now().subtract(Duration(
    hours: Random().nextInt(15),
    minutes: Random().nextInt(60),
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