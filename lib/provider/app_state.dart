import 'package:barriolympics/models/comment.dart';
import 'package:barriolympics/models/post.dart';
import 'package:flutter/material.dart';

import 'package:barriolympics/models/barrio.dart';
import 'package:barriolympics/models/user.dart';
import 'package:barriolympics/provider/dummy_data.dart';


class AppState extends ChangeNotifier {
  Barrio barrio = BARRIO_LIST[0];
  List<Barrio> barrioList = BARRIO_LIST;

  User user = User(id: 0, firstName: "Jake", lastName: "the Snake", events: EVENT_LIST.getRange(0, 2).toList());

  void likePost(Post post) {
    List<Post> posts = user.postsLiked.toList();
    if (posts.contains(post)) {
      posts.remove(post);
    } else {
      posts.add(post);
    }
    user.postsLiked = posts;
    notifyListeners();
  }

  void addComment(Post post, String comment) {
    post.comments.add(Comment(id: 10, user: this.user, text: comment, likes: 0, timePosted: DateTime.now()));
    notifyListeners();
  }
}
