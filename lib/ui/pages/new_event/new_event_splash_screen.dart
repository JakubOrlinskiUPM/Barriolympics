import 'package:flutter/material.dart';

class NewEventSplashScreen extends StatefulWidget {
  const NewEventSplashScreen({Key? key, required this.onPressed}) : super(key: key);

  final Function() onPressed;

  @override
  State<NewEventSplashScreen> createState() => _NewEventSplashScreenState();
}

class _NewEventSplashScreenState extends State<NewEventSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Image.asset("images/help.png"),
            Text("We help you all along the way!"),
            TextButton(
              onPressed: widget.onPressed,
              child: Text("Organize!"),
            )
          ],
        ),
      ),
    );
  }
}
