import 'package:barriolympics/models/uploadable.dart';

class Permit extends Uploadable {
  Permit({
    required this.uploadName,
    this.uploadDescription = "The permit for holding an event outdoors.",
    this.fileName,
    this.fileUrl,
  });

  String uploadName = "";
  String uploadDescription = "";
  String? fileName;
  String? fileUrl;

  bool get isDone {
    return fileUrl != null;
  }
}
