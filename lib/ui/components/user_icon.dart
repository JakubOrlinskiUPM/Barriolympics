import 'package:flutter/material.dart';

import 'package:barriolympics/models/user.dart';
import 'package:flutter/rendering.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    if (user.imageUrl != "") {
      return Image.network(user.imageUrl);
    } else {
      return Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Color(0xfff14014),
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Center(
          child: Text(
            user.initials,
            style: TextStyle(color: Colors.white, height: 1.5),
          ),
        ),
      );
    }
  }
}
