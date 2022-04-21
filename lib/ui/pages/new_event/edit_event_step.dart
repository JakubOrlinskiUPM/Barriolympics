import 'package:flutter/material.dart';

abstract class EditEventStep extends Widget {
  const EditEventStep({Key? key}) : super(key: key);

  IconData getIcon();
  String getTitle();
}