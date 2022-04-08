import 'package:flutter/material.dart';

import 'package:barriolympics/models/comment.dart';
import 'package:barriolympics/models/post.dart';
import 'package:barriolympics/models/event.dart';

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.imageUrl = "",
    this.postsLiked = const [],
    this.commentsLiked = const [],
    this.events = const [],
  });

  final int id;
  final String firstName;
  final String lastName;
  List<Post> postsLiked;
  List<Comment> commentsLiked;
  List<Event> events;
  final String imageUrl;

  String get fullName {
    return this.firstName + " " + this.lastName;
  }

  String get initials {
    return this.firstName[0] + this.lastName[0];
  }

  List<int> get postsLikedIds {
    return postsLiked.map((Post p) => p.id).toList();
  }
}
