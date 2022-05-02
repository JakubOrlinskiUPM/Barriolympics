import 'package:barriolympics/models/comment.dart';
import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/models/event_category.dart';
import 'package:barriolympics/models/location.dart';
import 'package:barriolympics/models/post.dart';
import 'package:barriolympics/ui/pages/events/event_filter_data.dart';
import 'package:flutter/material.dart';

import 'package:barriolympics/models/barrio.dart';
import 'package:barriolympics/models/user.dart';
import 'package:barriolympics/provider/dummy_data.dart';

class AppState extends ChangeNotifier {
  AppState() {
    EVENT_LIST.map((event) {
      event.barrio = BARRIO_LIST[0];
      return event;
    }).toList();

    EVENT_LIST[0].goingUsers = [user];
    EVENT_LIST[1].goingUsers = [user];

    // user.organisedEvents = [
    //   Event(
    //       id: 101,
    //       name: "BBQ",
    //       description: "A nice day out with some sausages",
    //       barrio: BARRIO_LIST[0],
    //       fileName: "Image.png",
    //       fileUrl: "https://media.istockphoto.com/photos/barbecue-camping-picture-id1177886278",
    //       date: DateTime(2022, 5, 15),
    //       time: TimeOfDay(hour: 16, minute: 30),
    //       location: Location(locationName: "Park"),
    //       organiser: user,
    //       isPublished: false),
    // ];
  }

  Barrio barrio = BARRIO_LIST[0];
  List<Barrio> barrioList = BARRIO_LIST;

  List<EventCategory> eventCategories = CATEGORY_LIST;

  User user = User(
    id: 0,
    firstName: "Jake",
    lastName: "Archibald",
    attendingEvents: EVENT_LIST.getRange(0, 2).toList(),
    organisedEvents: [],
  );

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
    post.comments.add(Comment(
        id: 10,
        user: this.user,
        text: comment,
        likes: 0,
        timePosted: DateTime.now()));
    notifyListeners();
  }

  List<Event> getEvents(EventFilterData _filterData) {
    List<Event> res = [];
    res.addAll(user.organisedEvents);
    res.addAll(barrio.events);

    res = res.where((event) => _filterData.doesEventMatch(event)).toList();

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

  void toggleEventAttendance(Event event) {
    List<Event> events = user.attendingEvents.toList();
    List<User> users = event.goingUsers.toList();

    if (user.attendingEvents.contains(event)) {
      events.remove(event);
      users.remove(user);
    } else {
      events.add(event);
      users.add(user);
    }

    user.attendingEvents = events;
    event.goingUsers = users;
    notifyListeners();
  }

  void toggleEventVolunteering(Event event) {
    List<Event> events = user.volunteeringEvents.toList();
    List<User> users = event.goingVolunteers.toList();

    if (user.volunteeringEvents.contains(event)) {
      events.remove(event);
      users.remove(user);
    } else {
      events.add(event);
      users.add(user);
    }

    user.volunteeringEvents = events;
    event.goingVolunteers = users;
    notifyListeners();
  }
}
