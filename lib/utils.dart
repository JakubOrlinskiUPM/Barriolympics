import 'dart:math';


getRandChoice(List list) {
  return list[Random(42).nextInt(list.length)];
}

getRandSublist(List list) {
  int index = Random(42).nextInt(list.length - 1);
  return list.sublist(index, list.length);
}