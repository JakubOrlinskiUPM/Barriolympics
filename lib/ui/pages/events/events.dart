import 'package:flutter/material.dart';

import 'package:barriolympics/ui/pages/events/events_page.dart';
import 'package:barriolympics/ui/pages/page_details.dart';
import 'package:barriolympics/ui/pages/routing.dart';


class Events extends PageDetails {
  String pageName = "Events";
  IconData pageIcon = Icons.event_rounded;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late Navigator navigator;

  Events() {
    navigator = Navigator(
      key: navigatorKey,
      onGenerateRoute: (route) {
        PageRoute? r = checkGeneralRoutes(route);
        if (r != null) {
          return r;
        }

        switch (route.name) {
          default:
            return MaterialPageRoute(
              settings: route,
              builder: (context) => const EventsPage(),
            );
        }
      },
      observers: [
        HeroController(),
      ],
    );
  }
}
