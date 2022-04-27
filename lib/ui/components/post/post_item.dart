import 'package:barriolympics/ui/components/post/comment_button.dart';
import 'package:barriolympics/ui/components/post/comment_modal.dart';
import 'package:barriolympics/ui/components/post/share_button.dart';
import 'package:barriolympics/ui/pages/image_view.dart';
import 'package:barriolympics/ui/pages/routing.dart';
import 'package:barriolympics/utils.dart';
import 'package:flutter/material.dart';

import 'package:barriolympics/ui/components/post/like_button.dart';
import 'package:barriolympics/ui/components/user_icon.dart';
import 'package:barriolympics/models/post.dart';

class PostItem extends StatefulWidget {
  const PostItem({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  void _showCommentModal() {
    showModalBottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: CommentModal(post: widget.post),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              horizontalTitleGap: 0,
              contentPadding: EdgeInsets.all(0),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserIcon(user: widget.post.author),
                ],
              ),
              title: Text(widget.post.author.fullName),
              subtitle: Text(formatDate(widget.post.timePosted)),
              trailing: PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Text("Item"),
                    ),
                  ];
                },
              ),
            ),
            Text(
              widget.post.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              widget.post.text,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.post.imageUrls.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.zero,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, POST_IMAGE_VIEW,
                            arguments: {"post": widget.post, "index": index});
                      },
                      child: Hero(
                        tag: widget.post.id.toString() + "-" + index.toString(),
                        child: Image.network(
                          widget.post.imageUrls[index],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Padding(padding: EdgeInsets.all(6));
                  },
                ),
              ),
            ),
            TextButton(
              onPressed: _showCommentModal,
              child: Text(widget.post.comments.length.toString() + " comments"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LikeButton(post: widget.post),
                CommentButton(post: widget.post, onTap: _showCommentModal),
                ShareButton(post: widget.post),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
