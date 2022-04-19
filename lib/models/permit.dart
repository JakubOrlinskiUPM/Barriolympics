class Permit {
  Permit({required this.name, required this.fileUrl});

  final String name;
  final String? fileUrl;

  bool get isDone {
    return fileUrl != null;
  }
}
