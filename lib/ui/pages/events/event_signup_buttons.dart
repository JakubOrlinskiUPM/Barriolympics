import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/provider/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventSignupButtons extends StatelessWidget {
  const EventSignupButtons({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, child) {
        bool isAttending = state.user.attendingEvents.contains(event);
        bool isVolunteering = state.user.volunteeringEvents.contains(event);

        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                      state.toggleEventAttendance(event);
                  },
                  label: Text(isAttending ? "Attending!" : "Attend"),
                  icon: Icon(isAttending ? Icons.check_box_rounded : Icons.help_center_outlined),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: OutlinedButton.icon(
                  onPressed: () {
                    state.toggleEventVolunteering(event);
                  },
                  label: Text(isVolunteering ? "Volunteering!" : "Volunteer"),
                  icon: Icon(isVolunteering ? Icons.handshake_rounded : Icons.handshake_outlined),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
