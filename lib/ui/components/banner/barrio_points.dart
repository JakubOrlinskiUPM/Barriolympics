import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/components/banner/banner_points.dart';
import 'package:barriolympics/ui/components/invisible_expanded.dart';
import 'package:barriolympics/ui/pages/help_page.dart';
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
                      OutlinedButton.icon(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 0, horizontal: 6)),
                        ),
                        onPressed: () {},
                        label: Text("Pick barrio", style: TextStyle(fontSize: 12),),
                        icon: Icon(Icons.map_outlined, size: 16,),
                      ),
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 0, horizontal: 6)),
                        ),
                        onPressed: () {
                          HelpPage.showHelpPage(context);
                        },
                        label: Text("Contribute", style: TextStyle(fontSize: 12),),
                        icon: Icon(Icons.handshake_outlined, size: 16,),
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
