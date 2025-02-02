import 'dart:math';

import 'package:barriolympics/models/barrio.dart';
import 'package:barriolympics/models/comment.dart';
import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/models/event_category.dart';
import 'package:barriolympics/models/location.dart';
import 'package:barriolympics/models/marker_type.dart';
import 'package:barriolympics/models/post.dart';
import 'package:barriolympics/models/user.dart';
import 'package:barriolympics/ui/pages/events/event_filter_data.dart';
import 'package:barriolympics/utils.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

bool isNetworkPresent = true;

List<User> USER_LIST = [
  User(id: 1, firstName: "John", lastName: "Johnson"),
  User(id: 2, firstName: "Robert", lastName: "Olson"),
  User(id: 3, firstName: "Jane", lastName: "Pratchett"),
  User(id: 4, firstName: "Dolly", lastName: "Parton"),
  User(id: 5, firstName: "Trevor", lastName: "Vic"),
  User(id: 6, firstName: "Zach", lastName: "McKenzie"),
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
    text: "I really love it!",
    likes: 0,
    timePosted: getRandDate(),
  ),
  Comment(
    id: 7,
    user: getRandChoice(USER_LIST),
    text: "So cool!",
    likes: 0,
    timePosted: getRandDate(),
  ),
  Comment(
    id: 8,
    user: getRandChoice(USER_LIST),
    text: "Looks amazing!",
    likes: 0,
    timePosted: getRandDate(),
  ),
  Comment(
    id: 9,
    user: getRandChoice(USER_LIST),
    text: "Amazing!",
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
    timePosted: getRandDate(0),
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
    timePosted: getRandDate(1),
  ),
  Post(
    id: 2,
    author: USER_LIST[2],
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
    timePosted: getRandDate(2),
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
    timePosted: getRandDate(3),
  ),
];

List<Event> EVENT_LIST = [
  Event(
    id: 0,
    name: "Outdoor BBQ",
    description:
        "The outdoor barbeque for everyone in the neighbourhood who still has not got plans for dinner! We will all be bringing own meat and veggies, so be sure to bring some to share with the others :)",
    fileUrl:
        "https://st2.depositphotos.com/1662991/11546/i/950/depositphotos_115465050-stock-photo-young-male-with-a-beard.jpg",
    date: DateTime(2022, 5, 24),
    time: const TimeOfDay(hour: 18, minute: 0),
    location: Location(
      locationName: "Park",
      markers: [
        {
          LatLng(40.434890, -3.726069): MarkerType(label: "Main activity", color: Colors.green),
        },
      ],
    ),
    organiser: getRandChoice(USER_LIST),
    categories: getRandSublist(CATEGORY_LIST.sublist(3)),
    isPublished: true,
  ),
  Event(
    id: 1,
    name: "Art exhibition",
    description:
        "There will be an art exhibition for everyone to stroll in. All kinds of art from madrileños will be shown. You can bring something to drink of you'd like ;)",
    fileUrl:
        "https://img.theculturetrip.com/1440x807/smart/wp-content/uploads/2017/04/reina-sofia-sala-3.jpg",
    date: DateTime(2022, 5, 15),
    time: const TimeOfDay(hour: 9, minute: 0),
    location: Location(
      locationName: "Gallery",
      markers: [
        {
          LatLng(40.413250, -3.698108): MarkerType(label: "Main activity", color: Colors.green),
        },
      ],
    ),
    organiser: getRandChoice(USER_LIST),
    categories: getRandSublist(CATEGORY_LIST.sublist(3)),
    isPublished: true,
  ),
  Event(
    id: 2,
    name: "Light show",
    description:
        "Part of the amazing light shows all over town. See what this street has to offer!",
    fileUrl:
        "https://phantom-elmundo.unidadeditorial.es/dbbeca15d0c12d0ad0d3f9c179db88a6/crop/93x0/1087x670/resize/700/f/webp/assets/multimedia/imagenes/2021/11/04/16360352948948.jpg",
    date: DateTime(2022, 5, 15),
    time: const TimeOfDay(hour: 23, minute: 0),
    location: Location(
      locationName: "Botanical garden",
      markers: [
        {
          LatLng(40.410677, -3.691365): MarkerType(label: "Main activity", color: Colors.green),
        },
      ],
    ),
    organiser: getRandChoice(USER_LIST),
    categories: getRandSublist(CATEGORY_LIST.sublist(3)),
    isPublished: true,
  ),
  Event(
    id: 3,
    name: "Outdoor cinema",
    description: "Old romantic movies to join whenever you'd like.",
    fileUrl:
        "https://socratessculpturepark.org/wp-content/uploads/2018/08/ssp-119_m-768x512.jpg",
    date: DateTime(2022, 6, 1),
    time: const TimeOfDay(hour: 20, minute: 0),
    location: Location(
      locationName: "Autocine",
      markers: [
        {
          LatLng(40.485914, -3.677616): MarkerType(label: "Main activity", color: Colors.green),
        },
      ],
    ),
    organiser: getRandChoice(USER_LIST),
    categories: getRandSublist(CATEGORY_LIST.sublist(3)),
    isPublished: true,
  ),
  Event(
    id: 4,
    name: "Basketball event",
    description:
        "Make sure to sign up, because there will be teams made. Only 24 spots!",
    fileUrl:
        "https://estaticos03.marca.com/albumes/2012/07/08/baloncesto_nike_festival/1341740668_extras_albumes_0.jpg",
    date: DateTime(2022, 6, 2),
    time: const TimeOfDay(hour: 19, minute: 0),
    location: Location(
      locationName: "Polideportivo",
      markers: [
        {
          LatLng(40.432683, -3.725307): MarkerType(label: "Main activity", color: Colors.green),
        },
      ],
    ),
    organiser: getRandChoice(USER_LIST),
    categories: getRandSublist(CATEGORY_LIST.sublist(3)),
    isPublished: true,
  ),
  Event(
    id: 5,
    name: "Pool Party",
    description:
        "A cool pool party for internationals, make sure to bring some cash if you want to buy something.",
    fileUrl:
        "https://www.partybus.es/wp-content/uploads/2019/05/POOL-PARTY-4.jpg",
    date: DateTime(2022, 6, 6),
    time: const TimeOfDay(hour: 12, minute: 0),
    location: Location(
      locationName: "C/ de Velásquez 36",
      markers: [
        {
          LatLng(40.418540, -3.731719): MarkerType(label: "Main activity", color: Colors.green),
        },
      ],
    ),
    organiser: getRandChoice(USER_LIST),
    categories: [CATEGORY_LIST.last],
    isPublished: true,
  ),
];

List<Barrio> BARRIO_LIST = [
  Barrio(
      id: 0,
      name: "Chamberí",
      events: EVENT_LIST,
      posts: POST_LIST,
      points: getRandPoints()),
  Barrio(id: 1, name: "La Latina", points: getRandPoints()),
  Barrio(id: 2, name: "Chueca", points: getRandPoints()),
  Barrio(id: 3, name: "Lavapies", points: getRandPoints()),
  Barrio(id: 4, name: "Retiro", points: getRandPoints()),
];

List<EventCategory> CATEGORY_LIST = [
  EventCategory(
    iconData: Icons.sports_soccer,
    label: "Attending",
    isSpecial: true,
    applyFilter: (EventFilterData filterData) {
      filterData.isAttending = filterData.isAttending == null ? true : null;
      return filterData;
    },
  ),
  EventCategory(
    iconData: Icons.sports_soccer,
    label: "Volunteering",
    isSpecial: true,
    applyFilter: (EventFilterData filterData) {
      filterData.isVolunteering =
          filterData.isVolunteering == null ? true : null;
      return filterData;
    },
  ),
  EventCategory(
    iconData: Icons.sports_soccer,
    label: "Organised",
    isSpecial: true,
    applyFilter: (EventFilterData filterData) {
      filterData.isOwn = filterData.isOwn == null ? true : null;
      return filterData;
    },
  ),
  EventCategory(
      iconData: Icons.format_paint_outlined, label: "Art", isSpecial: false),
  EventCategory(
      iconData: Icons.music_note_outlined, label: "Music", isSpecial: false),
  EventCategory(
      iconData: Icons.fastfood_outlined, label: "Food", isSpecial: false),
  EventCategory(
      iconData: Icons.museum_outlined, label: "Culture", isSpecial: false),
  EventCategory(
      iconData: Icons.sports_soccer, label: "Sport", isSpecial: false),
];
