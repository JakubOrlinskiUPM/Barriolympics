import 'package:barriolympics/ui/components/help_type.dart';
import 'package:barriolympics/ui/components/help_type.dart';
import 'package:barriolympics/ui/components/help_type.dart';
import 'package:barriolympics/ui/components/help_type.dart';
import 'package:barriolympics/ui/pages/routing.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("How you can help:",
              style: Theme.of(context).textTheme.headline5),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: const [
                HelpType(
                    text: "Organise an event!",
                    imagePath: "images/organise-img.png",
                    navigationPath: NEW_EVENT_FORM),
                HelpType(
                    text: "Volunteer!",
                    imagePath: "images/volunteer-img.png",
                    navigationPath: NEW_EVENT_FORM),
                HelpType(
                    text: "Make a poster!",
                    imagePath: "images/paint-img.png",
                    navigationPath: NEW_EVENT_FORM),
                HelpType(
                    text: "Attend!",
                    imagePath: "images/attend-img.png",
                    navigationPath: NEW_EVENT_FORM),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
