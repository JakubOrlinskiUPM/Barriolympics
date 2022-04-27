import 'package:flutter/material.dart';

class DismissibleModalBar extends StatelessWidget {
  const DismissibleModalBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Align(
        child: SizedBox(
          height: 5,
          width: 150,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade500,
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
      ),
    );
  }
}
