import 'package:barriolympics/models/barrio.dart';
import 'package:barriolympics/models/comment.dart';
import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/models/location.dart';
import 'package:barriolympics/models/post.dart';
import 'package:barriolympics/models/user.dart';
import 'package:barriolympics/utils.dart';

const List<User> USER_LIST = [
  User(id: 1, name: "John Johnson"),
  User(id: 2, name: "Jack Jackson"),
  User(id: 3, name: "Jane Janet"),
  User(id: 4, name: "John Johnson"),
  User(id: 5, name: "James Jameson"),
  User(id: 6, name: "Jonas Jonasson"),
];

List<Comment> COMMENT_LIST = [
  Comment(id: 0, user: getRandChoice(USER_LIST), text: "I love it!", likes: 0),
  Comment(id: 1, user: getRandChoice(USER_LIST), text: "Go for it!", likes: 0),
  Comment(
      id: 2, user: getRandChoice(USER_LIST), text: "This is great!", likes: 0),
  Comment(
      id: 3, user: getRandChoice(USER_LIST), text: "Yeah, I like it", likes: 0),
  Comment(
      id: 4, user: getRandChoice(USER_LIST), text: "Ohh so cool!", likes: 0),
  Comment(
      id: 5,
      user: getRandChoice(USER_LIST),
      text: "What is this about?",
      likes: 0),
];

List<Post> POST_LIST = [
  Post(
    id: 0,
    title: "A new neighbourhood garden opened!",
    text:
        "This opening was great, so many people showed up! Now everyone come and plant what you want!",
    likes: 0,
    imageUrls: [""],
    comments: getRandSublist(COMMENT_LIST),
  ),
  Post(
    id: 0,
    title: "Had a great time at the Drive-in cinema",
    text:
        "The show was great, I loved the movie! And all the food trucks were super cool!",
    likes: 0,
    imageUrls: [""],
    comments: getRandSublist(COMMENT_LIST),
  ),
  Post(
    id: 0,
    title: "The best walking tour of my life!",
    text:
        "I loved seeing the city in a new light and learning all about the area! 100% recommended!",
    likes: 0,
    imageUrls: [""],
    comments: getRandSublist(COMMENT_LIST),
  ),
];

List<Event> EVENT_LIST = [
  Event(
    id: 0,
    name: "Outdoor BBQ",
    description: "Lorem ipsum",
    imageUrl: "",
    startTime: DateTime(2022, 4, 24, 12),
    endTime: DateTime(2022, 4, 24, 18),
    location: const Location(locationName: "Park"),
    organiser: getRandChoice(USER_LIST),
  ),
  Event(
    id: 0,
    name: "Art exhibition",
    description: "Lorem ipsum",
    imageUrl: "",
    startTime: DateTime(2022, 4, 15, 10),
    endTime: DateTime(2022, 4, 15, 22),
    location: const Location(locationName: "Gallery"),
    organiser: getRandChoice(USER_LIST),
  ),
  Event(
    id: 0,
    name: "Light show",
    description: "Lorem ipsum",
    imageUrl: "",
    startTime: DateTime(2022, 4, 30, 18),
    endTime: DateTime(2022, 4, 31, 23),
    location: const Location(locationName: "Botanical garden"),
    organiser: getRandChoice(USER_LIST),
  ),
];

List<Barrio> BARRIO_LIST = [
  Barrio(id: 0, name: "Chamberi", events: EVENT_LIST, posts: POST_LIST),
  const Barrio(id: 1, name: "La Latina"),
  const Barrio(id: 2, name: "Chueca"),
  const Barrio(id: 3, name: "Lavapies"),
  const Barrio(id: 4, name: "Retiro"),
];
