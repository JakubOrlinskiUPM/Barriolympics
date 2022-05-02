import 'dart:io';

import 'package:barriolympics/models/uploadable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class UploadFormField extends StatefulWidget {
  const UploadFormField({
    Key? key,
    required this.uploadable,
    required this.onChange,
    this.imageOnly = false,
  }) : super(key: key);

  final Uploadable uploadable;
  final Function onChange;
  final bool imageOnly;

  @override
  State<UploadFormField> createState() => _UploadFormFieldState();
}

class _UploadFormFieldState extends State<UploadFormField> {
  List<String> extensions = [];
  String fileName = "";
  String? fileUrl;

  @override
  void initState() {
    super.initState();

    fileName = widget.uploadable.fileName ?? "";
    fileUrl = widget.uploadable.fileUrl;
    if (widget.imageOnly) {
      extensions = ['jpg', 'png'];
    } else {
      extensions = ['jpg', 'png', 'pdf', 'doc'];
    }
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: extensions,
    );

    if (result != null) {
      File f = File(result.files.single.path!);
      setState(() {
        fileName = f.path.split("/").last;
        fileUrl = f.path;

        widget.uploadable.fileName = fileName;
        widget.uploadable.fileUrl = f.path;
      });
      widget.onChange();
    }
  }

  String truncateFileName(String str, {limit = 10}) {
    String res = "";

    List<String> split = str.split(".");
    String ext = split.last;
    res += split.sublist(0, split.indexOf(ext)).join(".");

    if (res.length > limit) {
      res = res.substring(0, limit - 3) + "...";
    }

    res += "." + ext;
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.uploadable.uploadName),
      subtitle: Text(widget.uploadable.uploadDescription),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(truncateFileName(fileName)),
          fileUrl == null
              ? OutlinedButton.icon(
                  icon: Icon(Icons.file_copy_outlined),
                  label: Text("Pick file"),
                  onPressed: () {
                    pickFile();
                  },
                )
              : Row(
                  children: [
                    IconButton(
                      color: Theme.of(context).colorScheme.secondary,
                      onPressed: fileUrl != null
                          ? () {
                              OpenFile.open(fileUrl);
                            }
                          : null,
                      icon: Icon(Icons.download),
                    ),
                    IconButton(
                      color: Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        setState(() {
                          fileUrl = null;
                          fileName = "";
                        });
                      },
                      icon: Icon(Icons.delete_outline_rounded),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
