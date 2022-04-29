import 'package:barriolympics/models/event.dart';
import 'package:flutter/material.dart';

class EventGeneralDetails extends StatelessWidget {
  const EventGeneralDetails({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.people),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: event.goingUsers.length.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' going'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                String.fromCharCodes([0x00B7]),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: event.goingVolunteers.length.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' volunteering'),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.map_outlined),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "At: "),
                    TextSpan(
                        text: event.location!.locationName,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
