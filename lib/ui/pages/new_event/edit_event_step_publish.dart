import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/components/dismissible_modal_bar.dart';
import 'package:barriolympics/ui/components/event/event_item.dart';
import 'package:barriolympics/ui/pages/events/view_event_page.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step.dart';
import 'package:barriolympics/ui/pages/routing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditEventStepPublish extends StatefulWidget implements EditEventStep {
  const EditEventStepPublish({
    Key? key,
    required this.event,
    required this.nextStep,
    required this.previousStep,
  }) : super(key: key);

  final Event event;
  final Function nextStep;
  final Function previousStep;

  @override
  State<EditEventStepPublish> createState() => _EditEventStepPublishState();

  IconData getIcon() {
    return Icons.publish_outlined;
  }

  String getTitle() {
    return "Publish";
  }
}

class _EditEventStepPublishState extends State<EditEventStepPublish> {
  bool isEventDone(bool preview) {
    bool res = widget.event.name != null &&
        widget.event.time != null &&
        widget.event.date != null &&
        widget.event.fileUrl != null &&
        widget.event.location != null;
    if (!preview) {
      res =
          res && widget.event.permits.every((permit) => permit.fileUrl != null);
    }
    return res;
  }

  void Function()? showPreview(bool page) {
    if (isEventDone(true)) {
      return () {
        showModalBottomSheet(
          isDismissible: true,
          isScrollControlled: true,
          context: context,
          builder: (BuildContext ctx) {
            return AbsorbPointer(
              child: Container(
                constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 200),
                child: page
                    ? ViewEventPage(event: widget.event)
                    : EventItem(event: widget.event),
              ),
            );
          },
        );
      };
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Good job, you're nearly there!",
          textAlign: TextAlign.center,
        ),
        ListTile(
          title: Text("Preview event page"),
          subtitle: Text("Your event as a full page"),
          trailing: OutlinedButton.icon(
            icon: Icon(Icons.find_in_page),
            label: Text("Preview"),
            onPressed: showPreview(true),
          ),
        ),
        ListTile(
          title: Text("Preview event in a list"),
          subtitle: Text("Your event in a list"),
          trailing: OutlinedButton.icon(
            icon: Icon(Icons.list_alt),
            label: Text("Preview"),
            onPressed: showPreview(false),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ElevatedButton(
            onPressed: _publishEvent(),
            child: Text("Publish event"),
          ),
        ),
      ],
    );
  }

  void Function()? _publishEvent() {
    print(isEventDone(false));
    if (isEventDone(false)) {
      return () {
        widget.event.isPublished = true;
        Provider.of<AppState>(context, listen: false).publishEvent(widget.event);
        Navigator.pushNamed(context, EDIT_EVENT_SPLASH_PAGE);
      };
    } else {
      return null;
    }
  }
}
