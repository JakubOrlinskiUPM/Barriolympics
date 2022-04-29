import 'package:barriolympics/models/comment.dart';
import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/models/event_category.dart';
import 'package:barriolympics/models/post.dart';
import 'package:barriolympics/ui/pages/events/event_filter_data.dart';
import 'package:flutter/material.dart';

import 'package:barriolympics/models/barrio.dart';
import 'package:barriolympics/models/user.dart';
import 'package:barriolympics/provider/dummy_data.dart';


class AppState extends ChangeNotifier {
  Barrio barrio = BARRIO_LIST[0];
  List<Barrio> barrioList = BARRIO_LIST;

  List<EventCategory> eventCategories = CATEGORY_LIST;

  User user = User(id: 0, firstName: "Jake", lastName: "the Snake", attendingEvents: EVENT_LIST.getRange(0, 2).toList());

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

  List<Event> getEvents(EventFilterData _filterData) {
    List<Event> res = [];
    res.addAll(user.organisedEvents);
    res.addAll(barrio.events);

    print("before: " + res.length.toString());
    res = res.where((event) => _filterData.doesEventMatch(event)).toList();
    print("after: " + res.length.toString());

    return res;
  }

  void updateEvent(Event event) {
    if (user.organisedEvents.contains(event)) {
      user.organisedEvents[user.organisedEvents.indexOf(event)] = event;
    } else {
      List<Event> tmp = user.organisedEvents.toList();
      tmp.add(event);
      user.organisedEvents = tmp;
    }
    notifyListeners();
  }

  void publishEvent(Event event) {
    barrio.events.add(event);
    notifyListeners();
  }
}
