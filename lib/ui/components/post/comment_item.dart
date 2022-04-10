import 'package:barriolympics/models/comment.dart';
import 'package:barriolympics/ui/components/user_icon.dart';
import 'package:flutter/material.dart';


class CommentItem extends StatelessWidget {
  const CommentItem({Key? key, required this.comment}) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserIcon(user: comment.user,),
        ],
      ),
      title: Text(comment.user.fullName),
      subtitle: Text(comment.text),
    );
  }
}
