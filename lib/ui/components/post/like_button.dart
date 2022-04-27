import 'package:barriolympics/models/post.dart';
import 'package:barriolympics/provider/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {
      String text =
          state.user.postsLikedIds.contains(post.id) ? "Liked!" : "Like";
      IconData icon = state.user.postsLikedIds.contains(post.id)
          ? Icons.thumb_up
          : Icons.thumb_up_outlined;

      return Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: OutlinedButton(
            onPressed: () {
              state.likePost(post);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, size: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    text,
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
