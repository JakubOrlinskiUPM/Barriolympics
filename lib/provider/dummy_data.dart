import 'dart:math';

import 'package:barriolympics/models/barrio.dart';
import 'package:barriolympics/models/comment.dart';
import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/models/location.dart';
import 'package:barriolympics/models/post.dart';
import 'package:barriolympics/models/user.dart';
import 'package:barriolympics/utils.dart';
import 'package:flutter/material.dart';

bool isNetworkPresent = true;

List<User> USER_LIST = [
  User(id: 1, firstName: "John", lastName: "Johnson"),
  User(id: 2, firstName: "Jack", lastName: "Jackson"),
  User(id: 3, firstName: "Jane", lastName: "Janet"),
  User(id: 4, firstName: "John", lastName: "Johnson"),
  User(id: 5, firstName: "James", lastName: "Jameson"),
  User(id: 6, firstName: "Jonas", lastName: "Jonasson"),
];

List<Comment> COMMENT_LIST = [
  Comment(
    id: 0,
    user: getRandChoice(USER_LIST),
    text: "I love it!",
    likes: 0,
    timePosted: getRandDate(),
  ),
  Comment(
    id: 1,
    user: getRandChoice(USER_LIST),
    text: "Go for it!",
    likes: 0,
    timePosted: getRandDate(),
  ),
  Comment(
    id: 2,
    user: getRandChoice(USER_LIST),
    text: "This is great!",
    likes: 0,
    timePosted: getRandDate(),
  ),
  Comment(
    id: 3,
    user: getRandChoice(USER_LIST),
    text: "Yeah, I like it",
    likes: 0,
    timePosted: getRandDate(),
  ),
  Comment(
    id: 4,
    user: getRandChoice(USER_LIST),
    text: "Ohh so cool!",
    likes: 0,
    timePosted: getRandDate(),
  ),
  Comment(
    id: 5,
    user: getRandChoice(USER_LIST),
    text: "What is this about?",
    likes: 0,
    timePosted: getRandDate(),
  ),
  Comment(
    id: 6,
    user: getRandChoice(USER_LIST),
    text: "I love it!",
    likes: 0,
    timePosted: getRandDate(),
  ),
  Comment(
    id: 7,
    user: getRandChoice(USER_LIST),
    text: "I love it!",
    likes: 0,
    timePosted: getRandDate(),
  ),
  Comment(
    id: 8,
    user: getRandChoice(USER_LIST),
    text: "I love it!",
    likes: 0,
    timePosted: getRandDate(),
  ),
  Comment(
    id: 9,
    user: getRandChoice(USER_LIST),
    text: "I love it!",
    likes: 0,
    timePosted: getRandDate(),
  ),
];

List<Post> POST_LIST = [
  Post(
    id: 0,
    author: getRandChoice(USER_LIST),
    title: "A new neighbourhood garden opened!",
    text:
        "This opening was great, so many people showed up! Now everyone come and plant what you want!",
    likes: 0,
    imageUrls: [
      if (isNetworkPresent) ...[
        "https://i.insider.com/5ccb2204e9f08a27c3522ac4?width=2000&format=jpeg&auto=webp",
        "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/ruth-bancroft-garden-san-francisco-waterwise-garden-1639608182.jpg?crop=1xw:1xh;center,top&resize=980:*",
        "https://upload.wikimedia.org/wikipedia/commons/9/9d/Autumn_Colours_-_Stourhead_-_geograph.org.uk_-_1044997.jpg"
      ]
    ],
    comments: getRandSublist(COMMENT_LIST),
    timePosted: getRandDate(),
  ),
  Post(
    id: 1,
    author: getRandChoice(USER_LIST),
    title: "Had a great time at the Drive-in cinema",
    text:
        "The show was great, I loved the movie! And all the food trucks were super cool!",
    likes: 0,
    imageUrls: [
      if (isNetworkPresent) ...[
        "https://usercontent.one/wp/northerntimes.nl/wp-content/uploads/2020/04/drive-in-bioscoop-amsterdam-den-haag-scaled-e1587457304723-1140x570.jpg?media=1643034510",
        "https://afbeelding.dvhn.nl/dvhn/incoming/6ueilh-drive-in-bioscoop.jpg/alternates/LANDSCAPE_1920/drive-in%20bioscoop.jpg"
      ]
    ],
    comments: getRandSublist(COMMENT_LIST),
    timePosted: getRandDate(),
  ),
  Post(
    id: 2,
    author: getRandChoice(USER_LIST),
    title: "The best walking tour of my life!",
    text:
        "I loved seeing the city in a new light and learning all about the area! 100% recommended!",
    likes: 0,
    imageUrls: [
      if (isNetworkPresent) ...[
        "https://foodandroad.com/wp-content/uploads/2021/04/free-walking-tour-group-meeting-point-2.jpg"
      ]
    ],
    comments: getRandSublist(COMMENT_LIST),
    timePosted: getRandDate(),
  ),
  Post(
    id: 3,
    author: getRandChoice(USER_LIST),
    title: "I love this neighbourhood!",
    text: "Chamberí for life!",
    likes: 0,
    imageUrls: [
      if (isNetworkPresent) ...[
        "https://9968c6ef49dc043599a5-e151928c3d69a5a4a2d07a8bf3efa90a.ssl.cf2.rackcdn.com/237782-1.jpg"
      ]
    ],
    comments: getRandSublist(COMMENT_LIST),
    timePosted: getRandDate(),
  ),
];

List<Event> EVENT_LIST = [
  Event(
    id: 0,
    name: "Outdoor BBQ",
    description: "Lorem ipsum",
    imageUrl: "",
    date: DateTime(2022, 4, 24),
    time: const TimeOfDay(hour: 12, minute: 0),
    location: const Location(locationName: "Park"),
    organiser: getRandChoice(USER_LIST),
    isPublished: true,
  ),
  Event(
    id: 1,
    name: "Art exhibition",
    description: "Lorem ipsum",
    imageUrl: "",
    date: DateTime(2022, 4, 15),
    time: const TimeOfDay(hour: 12, minute: 0),
    location: const Location(locationName: "Gallery"),
    organiser: getRandChoice(USER_LIST),
    isPublished: true,
  ),
  Event(
    id: 2,
    name: "Light show",
    description: "Lorem ipsum",
    imageUrl: "",
    date: DateTime(2022, 4, 30),
    time: const TimeOfDay(hour: 12, minute: 0),
    location: const Location(locationName: "Botanical garden"),
    organiser: getRandChoice(USER_LIST),
    isPublished: true,
  ),
  Event(
    id: 3,
    name: "Outdoor cinema",
    description: "Lorem ipsum",
    imageUrl:
        "https://img.theculturetrip.com/1440x807/smart/wp-content/uploads/2018/07/096.jpg",
    date: DateTime(2022, 4, 30),
    time: const TimeOfDay(hour: 12, minute: 0),
    location: const Location(locationName: "Autocine Madrid"),
    organiser: getRandChoice(USER_LIST),
    isPublished: true,
  ),
  Event(
    id: 4,
    name: "Basketball event",
    description: "Lorem ipsum",
    imageUrl:
        "https://estaticos03.marca.com/albumes/2012/07/08/baloncesto_nike_festival/1341740668_extras_albumes_0.jpg",
    date: DateTime(2022, 4, 30),
    time: const TimeOfDay(hour: 12, minute: 0),
    location: const Location(locationName: "Parque de baloncesto"),
    organiser: getRandChoice(USER_LIST),
    isPublished: true,
  ),
  Event(
    id: 5,
    name: "Pool Party",
    description: "Lorem ipsum",
    imageUrl:
        "https://www.partybus.es/wp-content/uploads/2019/05/POOL-PARTY-4.jpg",
    date: DateTime(2022, 4, 30),
    time: const TimeOfDay(hour: 12, minute: 0),
    location: const Location(locationName: "Calle de Velásquez 36"),
    organiser: getRandChoice(USER_LIST),
    isPublished: true,
  ),
];

List<Barrio> BARRIO_LIST = [
  Barrio(
      id: 0,
      name: "Chamberi",
      events: EVENT_LIST,
      posts: POST_LIST,
      points: getRandPoints()),
  Barrio(id: 1, name: "La Latina", points: getRandPoints()),
  Barrio(id: 2, name: "Chueca", points: getRandPoints()),
  Barrio(id: 3, name: "Lavapies", points: getRandPoints()),
  Barrio(id: 4, name: "Retiro", points: getRandPoints()),
];
