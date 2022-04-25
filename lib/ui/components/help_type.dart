import 'package:flutter/material.dart';

class HelpType extends StatelessWidget {
  const HelpType(
      {Key? key,
      required this.text,
      required this.imagePath,
      required this.navigationPath})
      : super(key: key);

  final String text;
  final String imagePath;
  final String navigationPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, navigationPath);
          },
          child: Container(
            padding: EdgeInsets.all(4),
            child: Column(
              children: [
                Text(text, textAlign: TextAlign.center, style: TextStyle(color: Colors.black),),
                Expanded(
                  child: Image(
                    image: AssetImage(this.imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
