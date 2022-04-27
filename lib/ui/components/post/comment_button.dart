import 'package:barriolympics/models/post.dart';
import 'package:barriolympics/provider/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentButton extends StatelessWidget {
  const CommentButton({Key? key, required this.post, required this.onTap}) : super(key: key);

  final Post post;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {

      return Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: OutlinedButton(
            onPressed: this.onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.comment, size: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    "Comment",
                    style: const TextStyle(height: 1.5),
                  ),
                ),
              ],
            ),
        ),
      );
    });
  }
}
