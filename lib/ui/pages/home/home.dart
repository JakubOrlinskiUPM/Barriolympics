import 'package:flutter/material.dart';

import 'package:barriolympics/ui/pages/home/home_page.dart';
import 'package:barriolympics/ui/pages/page_details.dart';
import 'package:barriolympics/ui/pages/routing.dart';


class Home extends PageDetails {
  String pageName = "Home";
  IconData pageIcon = Icons.home_filled;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late Navigator navigator;

  Home() {
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
              builder: (context) => const HomePage(),
            );
        }
      },
      observers: [
        HeroController(),
      ],
    );
  }
}
