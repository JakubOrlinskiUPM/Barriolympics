import 'package:barriolympics/main.dart';
import 'package:barriolympics/models/comment.dart';
import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/components/post/comment_item.dart';
import 'package:barriolympics/ui/components/user_icon.dart';
import 'package:barriolympics/utils.dart';
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
  final commentController = TextEditingController();
  final commentScrollController = ScrollController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    commentController.dispose();
    commentScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List orderedComments = getOrderedListByDate(widget.post.comments);

    return SafeArea(
      child: FractionallySizedBox(
        heightFactor: 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                height: 5,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
              ),
            ),
            Text(
              "Comments",
              style: Theme.of(context).textTheme.headline5,
            ),
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 1,
                child: ListView.builder(
                  controller: commentScrollController,
                  itemCount: orderedComments.length,
                  itemBuilder: (context, index) {
                    return CommentItem(comment: orderedComments[index]);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: commentController,
                autofocus: true,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      Provider.of<AppState>(context, listen: false)
                          .addComment(widget.post, commentController.text);
                      commentController.text = "";
                      commentScrollController.animateTo(
                        0,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.ease,
                      );
                    },
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  icon: UserIcon(user: Provider.of<AppState>(context).user),
                  hintText: "Write a comment...",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
