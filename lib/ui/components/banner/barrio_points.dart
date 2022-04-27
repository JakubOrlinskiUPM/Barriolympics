import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/components/banner/banner_points.dart';
import 'package:barriolympics/ui/components/invisible_expanded.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BarrioPoints extends StatelessWidget {
  const BarrioPoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (ctx, state, child) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.barrio.name,
                    ),
                    BannerPoints(state: state),
                  ],
                ),
                InvisibleExpandedHeader(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 0, horizontal: 6)),
                          foregroundColor: MaterialStateProperty.all(Colors.white)
                        ),
                        onPressed: () {},
                        label: Text("Earn points", style: TextStyle(fontSize: 12),),
                        icon: Icon(Icons.handshake_outlined, size: 16,),
                      ),
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 0, horizontal: 6)),
                          foregroundColor: MaterialStateProperty.all(Colors.white)
                        ),
                        onPressed: () {},
                        label: Text("Your points", style: TextStyle(fontSize: 12),),
                        icon: Icon(Icons.star, size: 16,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
