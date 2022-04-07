import 'package:barriolympics/models/user.dart';

class Comment {
  const Comment({
    required this.id,
    required this.user,
    required this.text,
    required this.likes,
  });

  final int id;
  final User user;
  final String text;
  final int likes;
}