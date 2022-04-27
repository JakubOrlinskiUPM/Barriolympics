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
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(child: Image.asset("images/help.png")),
            Center(child: Text("We help you all along the way!")),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  AppState appSatte =
                      Provider.of<AppState>(context, listen: false);
                  Navigator.pushNamed(context, EDIT_EVENT_PAGE, arguments: {
                    'event': Event(
                        id: 1000,
                        barrio: appSatte.barrio,
                        isPublished: false,
                        organiser: appSatte.user),
                  });
                },
                child: Text("Organize!"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
