import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/components/banner/banner_points.dart';
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
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(BORDER_RADIUS))
        ),
        backgroundColor: Color(0xFFFFA98E),
        pinned: true,
        snap: true,
        floating: true,
        expandedHeight: 160.0,
        collapsedHeight: 60.0,
        centerTitle: false,
        title: Text('Hi ${Provider
            .of<AppState>(context)
            .user
            .firstName}!'),
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(BORDER_RADIUS)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFF8795),
                  Color(0xFFFFA98E),
                ],
              ),
            ),
            child: SafeArea(
              child: Consumer<AppState>(
                builder: (ctx, state, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              state.barrio.name,
                              style: Theme
                                  .of(ctx)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(color: Colors.black),
                            ),

                            BannerPoints(state: state)
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
    );
  }
}
