import 'package:barriolympics/models/comment.dart';
import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/components/post/comment_item.dart';
import 'package:barriolympics/ui/components/user_icon.dart';
import 'package:flutter/material.dart';

import 'package:barriolympics/models/post.dart';
import 'package:provider/provider.dart';

class CommentModal extends StatefulWidget {
  const CommentModal({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<CommentModal> createState() => _CommentModalState();
}

class _CommentModalState extends State<CommentModal> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.8,
              child: ListView.builder(
                itemCount: widget.post.comments.length,
                itemBuilder: (context, index) {
                  return CommentItem(comment: widget.post.comments[index]);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                suffixIcon: Icon(Icons.send),
                border: OutlineInputBorder(
                  gapPadding: 0.0,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                icon: UserIcon(user: Provider.of<AppState>(context).user),
                hintText: "Write a comment...",
                alignLabelWithHint: true,
                hintStyle: TextStyle(height: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
