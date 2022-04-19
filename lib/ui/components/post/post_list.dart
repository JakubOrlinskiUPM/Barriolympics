import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/utils.dart';
import 'package:flutter/material.dart';

import 'package:barriolympics/models/post.dart';
import 'package:barriolympics/ui/components/post/post_item.dart';
import 'package:provider/provider.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, widget) {
        List orderedPosts = getOrderedListByDate(state.barrio.posts);

        return SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              Post post = orderedPosts[index];
              return PostItem(post: post);
            },
            childCount: orderedPosts.length,
          ),
        );
      },
    );
  }
}
