import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/pages/routing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditEventSplashScreen extends StatefulWidget {
  const EditEventSplashScreen({Key? key}) : super(key: key);

  @override
  State<EditEventSplashScreen> createState() => _EditEventSplashScreenState();
}

class _EditEventSplashScreenState extends State<EditEventSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Congratulations!"),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(child: Image.asset("images/help.png")),
            Center(child: Text("You managed to make an event!")),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, EVENT_LIST_VIEW_ROUTE);
                },
                icon: Icon(Icons.home),
                label: Text("Back to home screen"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
