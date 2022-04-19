import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/pages/routing.dart';
import 'package:flutter/material.dart';

class BannerPoints extends StatelessWidget {
  const BannerPoints({Key? key, required this.state}) : super(key: key);

  final AppState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: TextButton.icon(
          onPressed: () {
            Navigator.of(context).pushNamed(STATISTICS_VIEW);
          },
          icon: Icon(Icons.star, size: 25),
          label: Text(
            state.barrio.points.toString(),
            style: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(fontSize: 20, height: 1.8),
          ),
        ),
      ),
    );
  }
}
