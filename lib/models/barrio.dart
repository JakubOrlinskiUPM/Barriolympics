
import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/models/post.dart';

class Barrio {
  Barrio({
    required this.id,
    required this.name,
    this.points = 0,
    this.posts = const [],
    this.events = const [],
  });

  final int id;
  final String name;
  final int points;
  List<Post> posts;
  List<Event> events;
}