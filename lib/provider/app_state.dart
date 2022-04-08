import 'package:barriolympics/models/post.dart';
import 'package:flutter/material.dart';

import 'package:barriolympics/models/barrio.dart';
import 'package:barriolympics/models/user.dart';
import 'package:barriolympics/provider/dummy_data.dart';


class AppState extends ChangeNotifier {
  Barrio barrio = BARRIO_LIST[0];
  List<Barrio> barrioList = BARRIO_LIST;

  User user = User(id: 0, firstName: "Jake", lastName: "the Snake", events: EVENT_LIST.getRange(0, 2).toList());

  void addEvents() {
    List<Post> list = barrio.posts;
    list.add(POST_LIST[0]);
    barrio.posts = list;
    notifyListeners();
  }

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
}
