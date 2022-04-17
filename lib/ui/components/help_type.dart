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
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, navigationPath);
      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(
              width: 2,
              color: Color(0xFFFF6E00),
            ),
          ),
          child: Column(
            children: [
              Text(text),
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
    );
  }
}
