import 'package:flutter/cupertino.dart';

class EventCategory {
  const EventCategory({
    required this.iconData,
    required this.label,
    required this.isSpecial,
    this.applyFilter,
  });

  final String label;
  final IconData iconData;
  final bool isSpecial;
  final Function? applyFilter;
}
