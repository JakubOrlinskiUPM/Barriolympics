import 'package:flutter/material.dart';

import 'package:barriolympics/models/post.dart';
import 'package:barriolympics/provider/dummy_data.dart';
import 'package:barriolympics/ui/components/post/post_item.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 0.7,
        child: ListView.builder(
          itemCount: POST_LIST.length,
          itemBuilder: (BuildContext context, index) {
            Post post = POST_LIST[index];
            return PostItem(post: post);
          },
        ),
      ),
    );
  }
}
