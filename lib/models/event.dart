import 'package:barriolympics/models/user.dart';
import 'package:barriolympics/models/location.dart';


class Event {
  const Event({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.startTime,
    required this.endTime,
    required this.location,

    required this.organiser,
    this.goingUsers = const [],
    this.goingVolunteers = const [],
    this.goingSellers = const [],
  });

  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final DateTime startTime;
  final DateTime endTime;
  final Location location;

  final User organiser;
  final List<User> goingUsers;
  final List<User> goingVolunteers;
  final List<User> goingSellers;
}