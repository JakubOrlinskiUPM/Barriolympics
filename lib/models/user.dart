import 'package:barriolympics/models/comment.dart';
import 'package:barriolympics/models/post.dart';
import 'package:barriolympics/models/event.dart';

class User {
  const User({
    required this.id,
    required this.name,
    this.postsLiked = const [],
    this.commentsLiked = const [],
    this.events = const []
  });

  final int id;
  final String name;
  final List<Post> postsLiked;
  final List<Comment> commentsLiked;
  final List<Event> events;
}