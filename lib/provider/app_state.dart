import 'package:flutter/material.dart';

import 'package:barriolympics/models/barrio.dart';
import 'package:barriolympics/models/user.dart';

import 'package:barriolympics/provider/dummy_data.dart';


class AppState extends ChangeNotifier {
  Barrio barrio = BARRIO_LIST[0];
  List<Barrio> barrioList = BARRIO_LIST;

  User user = User(id: 0, name: "Jake the Snake", events: EVENT_LIST.getRange(0, 2).toList());
}
