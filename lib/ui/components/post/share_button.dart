import 'package:barriolympics/models/post.dart';
import 'package:barriolympics/provider/app_state.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {
      return OutlinedButton(
          onPressed: () {
            // Share.share("Barriolympics is the best!");
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
      );
    });
  }
}
