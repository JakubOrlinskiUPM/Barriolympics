import 'package:barriolympics/models/barrio.dart';
import 'package:barriolympics/models/event_category.dart';
import 'package:barriolympics/models/permit.dart';
import 'package:barriolympics/models/uploadable.dart';
import 'package:barriolympics/models/user.dart';
import 'package:barriolympics/models/location.dart';
import 'package:flutter/material.dart';


class Event extends Uploadable {
  Event({
    required this.id,
    this.barrio,
    this.name,
    this.description,
    this.fileName,
    this.fileUrl,
    this.date,
    this.time,
    this.location,
    this.volunteersNeeded,
    this.permits = const [],
    this.categories = const [],

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
  DateTime? date;
  TimeOfDay? time;
  Location? location;
  int? volunteersNeeded;
  List<Permit> permits;
  List<EventCategory> categories;

  bool isPublished;

  final User organiser;
  List<User> goingUsers;
  List<User> goingVolunteers;
  List<User> goingSellers;

  String? fileName;
  String? fileUrl;
  String uploadName = "Event poster";
  String uploadDescription = "The image that represents the event";

  List<Permit> neededPermits() {
    return [Permit(uploadName: "Modelo 750C-a")];
  }
}