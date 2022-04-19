import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/pages/routing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewEventSplashScreen extends StatefulWidget {
  const NewEventSplashScreen({Key? key}) : super(key: key);

  @override
  State<NewEventSplashScreen> createState() => _NewEventSplashScreenState();
}

class _NewEventSplashScreenState extends State<NewEventSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Organise an event!"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset("images/help.png"),
              Text("We help you all along the way!"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, EDIT_EVENT_PAGE, arguments: {
                    'event': Event(id: 1000, isPublished: false, organiser: Provider.of<AppState>(context, listen: false).user),
                  });
                },
                child: Text("Organize!"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
