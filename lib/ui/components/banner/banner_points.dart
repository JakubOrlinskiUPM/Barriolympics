import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/pages/routing.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BannerPoints extends StatelessWidget {
  const BannerPoints({Key? key, required this.state}) : super(key: key);

  final AppState state;

  String _formatPoints(int points) {
    return NumberFormat.decimalPattern().format(points).replaceAll(",", " ");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _formatPoints(state.barrio.points),
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontSize: 15, height: 1.5),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("points"),
        ),
      ],
    );
  }
}
