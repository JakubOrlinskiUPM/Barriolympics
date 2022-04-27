import 'dart:math';

import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/components/banner/barrio_points.dart';
import 'package:barriolympics/ui/components/banner/banner_points.dart';
import 'package:barriolympics/ui/components/invisible_expanded.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopBanner extends StatefulWidget {
  const TopBanner({Key? key}) : super(key: key);

  @override
  State<TopBanner> createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  double BORDER_RADIUS = 30;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(BORDER_RADIUS))),
      backgroundColor: Color(0xFFFFA98E),
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: 250,
      collapsedHeight: 90.0,
      centerTitle: false,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        centerTitle: true,
        title: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InvisibleExpandedHeader(
                    child: Text(
                      'Hi ${Provider.of<AppState>(context).user.firstName}!',
                    ),
                  ),
                  BarrioPoints(),
                ],
              ),
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(BORDER_RADIUS)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFF8795),
                Color(0xFFFFA98E),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
