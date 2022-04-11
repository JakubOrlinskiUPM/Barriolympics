import 'package:barriolympics/models/post.dart';
import 'package:barriolympics/ui/pages/image_view.dart';
import 'package:barriolympics/ui/pages/statistics_page.dart';
import 'package:flutter/material.dart';

const String POST_IMAGE_VIEW = "postImageView";
const String STATISTICS_VIEW = "statisticsView";
const String EVENT_LIST_VIEW_ROUTE = "eventListView";

PageRoute? checkGeneralRoutes(route) {
  switch (route.name) {
    case POST_IMAGE_VIEW:
      return PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          final args = ModalRoute.of(context)?.settings.arguments;
          Post post = args != null ? (args as Map)['post'] : null;

          return ImageView(
            post: post,
            index: 0,
          );
        },
          barrierDismissible: true,
      );
    case STATISTICS_VIEW:
      return PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
        return const StatisticsPage();
      });
  }
}
