
import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/models/post.dart';

class Barrio {
  const Barrio({
    required this.id,
    required this.name,
    this.points = 0,
    this.posts = const [],
    this.events = const [],
  });

  final int id;
  final String name;
  final int points;
  final List<Post> posts;
  final List<Event> events;
}