import 'package:barriolympics/models/comment.dart';
import 'package:barriolympics/models/user.dart';

class Post {
  const Post({
    required this.id,
    required this.author,
    required this.title,
    required this.text,
    required this.likes,
    required this.imageUrls,
    required this.comments,
    required this.timePosted,
  });

  final int id;
  final User author;
  final String title;
  final String text;
  final int likes;
  final List<String> imageUrls;
  final List<Comment> comments;
  final DateTime timePosted;

  String get timePostedFormatted {
    String res = "";
    Duration diff = DateTime.now().difference(this.timePosted);

    if (diff.inHours > 0) {
      res = diff.inHours.toString() + " hours ago";
    } else if (diff.inMinutes > 0) {
      res = diff.inMinutes.toString() + " minutes ago";
    } else {
      res = "Just now";
    }

    return res;
  }
}