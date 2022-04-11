import 'package:barriolympics/models/comment.dart';
import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/components/user_icon.dart';
import 'package:barriolympics/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({Key? key, required this.comment}) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    bool isOwn = Provider.of<AppState>(context, listen: false).user.id ==
        comment.user.id;

    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserIcon(
            user: comment.user,
          ),
        ],
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            comment.user.fullName,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              formatDate(comment.timePosted),
              style: Theme.of(context).textTheme.caption,
            ),
          )
        ],
      ),
      subtitle: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: UnconstrainedBox(
            constrainedAxis: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                color: isOwn ? Colors.orange.shade200 : Colors.grey.shade200,
              ),
              child: Text(comment.text),
            ),
          ),
        ),
      ),
    );
  }
}
