import 'package:flutter/material.dart';

const String EVENT_LIST_VIEW_ROUTE = "eventListView";

MaterialPageRoute? checkGeneralRoutes(route) {
  switch (route.name) {
    case EVENT_LIST_VIEW_ROUTE:
      return MaterialPageRoute(
        settings: route,
        builder: (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          return Container();
        },
      );
  }
}
