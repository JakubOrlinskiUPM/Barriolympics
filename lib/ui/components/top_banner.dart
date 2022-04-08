import 'package:barriolympics/provider/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopBanner extends StatefulWidget {
  const TopBanner({Key? key}) : super(key: key);

  @override
  State<TopBanner> createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliverAppBar(
        backgroundColor: Color(0xFFFFA98E),
        pinned: true,
        snap: true,
        floating: true,
        expandedHeight: 160.0,
        collapsedHeight: 60.0,
        title: Text('Welcome ${Provider.of<AppState>(context).user.fullName}!'),
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Container(
            decoration: const BoxDecoration(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text("Here goes stuff about chamberí")],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
