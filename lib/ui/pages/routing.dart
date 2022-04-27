import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/models/post.dart';
import 'package:barriolympics/ui/pages/image_view.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_page.dart';
import 'package:barriolympics/ui/pages/new_event/new_event_splash_screen.dart';
import 'package:barriolympics/ui/pages/statistics_page.dart';
import 'package:barriolympics/utils.dart';
import 'package:flutter/material.dart';

import 'events/view_event_page.dart';

const String POST_IMAGE_VIEW = "postImageView";
const String STATISTICS_VIEW = "statisticsView";
const String EVENT_LIST_VIEW_ROUTE = "eventListView";
const String EDIT_EVENT_PAGE = "editEventPage";
const String NEW_EVENT_PAGE = "newEventPage";
const String VIEW_EVENT_PAGE = "viewEventPage";


PageRoute? checkGeneralRoutes(RouteSettings route) {
  switch (route.name) {
    case POST_IMAGE_VIEW:
      return PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          Post? post = getArgument(route, "post");
          return ImageView(
            post: post,
            index: 0,
          );
        },
        opaque: false,
      );
    case STATISTICS_VIEW:
      return PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
        return const StatisticsPage();
      });
    case NEW_EVENT_PAGE:
      return PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
        return const NewEventSplashScreen();
      });
    case EDIT_EVENT_PAGE:
      return PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
        Event event = getArgument(route, "event");
        return EditEventPage(event: event);
      });
    case VIEW_EVENT_PAGE:
      return PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
        Event event = getArgument(route, "event");
        return ViewEventPage(event: event);
      });
  }
  return null;
}
