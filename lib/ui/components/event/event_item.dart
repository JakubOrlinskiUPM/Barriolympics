import 'dart:ffi';
// import 'dart:html';

import 'package:barriolympics/ui/components/post/comment_button.dart';
import 'package:barriolympics/ui/components/post/comment_modal.dart';
import 'package:barriolympics/ui/components/post/share_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:barriolympics/ui/components/post/like_button.dart';
import 'package:barriolympics/ui/components/user_icon.dart';
import 'package:barriolympics/models/event.dart';

import '../../../models/event.dart';

class EventItem extends StatefulWidget {
  const EventItem({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ListTile(
          horizontalTitleGap: 0,
          contentPadding: EdgeInsets.all(0),
          title: Text(widget.event.name),


          ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.event.imageUrl.length,
                  itemBuilder: (context, index) {
                    return Image.network(widget.event.imageUrl[index],
                      errorBuilder: (context, exception, stackTrack) => Icon(Icons.error,),
                        loadingBuilder: (context, exception, stackTrack) => CircularProgressIndicator(),

                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Padding(padding: EdgeInsets.all(6));
                  },
                ),
              ),
            ),
        ]
        ),
        ),
      );
  }
}
