import 'package:barriolympics/models/barrio.dart';
import 'package:barriolympics/models/permit.dart';
import 'package:barriolympics/models/user.dart';
import 'package:barriolympics/models/location.dart';
import 'package:flutter/material.dart';


class Event {
  Event({
    required this.id,
    this.barrio,
    this.name,
    this.description,
    this.imageUrl = "",
    this.date,
    this.time,
    this.location,
    this.permits = const [],

    required this.isPublished,

    required this.organiser,
    this.goingUsers = const [],
    this.goingVolunteers = const [],
    this.goingSellers = const [],
  });

  final int id;
  Barrio? barrio;
  String? name;
  String? description;
  String? imageUrl;
  DateTime? date;
  TimeOfDay? time;
  Location? location;
  List<Permit> permits;

  final bool isPublished;

  final User organiser;
  List<User> goingUsers;
  List<User> goingVolunteers;
  List<User> goingSellers;

  bool get step1 {
    return name != null && description != null;
  }
  bool get step2 {
    return location != null;
  }
  bool get step3 {
    return permits.every((permit) => permit.isDone);
  }
  bool get step4 {
    return isPublished;
  }
}