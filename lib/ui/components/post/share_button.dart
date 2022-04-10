import 'package:barriolympics/models/post.dart';
import 'package:barriolympics/provider/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {
      return Expanded(
        child: OutlinedButton(
          onPressed: () {
            // state.likePost(post);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.share,
                size: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Text(
                  "Share",
                  style: TextStyle(height: 1.5),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
