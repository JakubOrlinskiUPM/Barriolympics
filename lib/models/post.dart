import 'package:barriolympics/models/comment.dart';

class Post {
  const Post({
    required this.id,
    required this.title,
    required this.text,
    required this.likes,
    required this.imageUrls,
    required this.comments,
  });

  final int id;
  final String title;
  final String text;
  final int likes;
  final List<String> imageUrls;
  final List<Comment> comments;
}