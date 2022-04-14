import 'package:flutter/material.dart';
import 'package:barriolympics/ui/components/top_banner.dart';
import 'package:barriolympics/ui/components/event/event_list.dart';
import 'package:barriolympics/ui/components/post/like_button.dart';
import 'package:barriolympics/ui/pages/events/filter_page.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const TopBanner(),
          SliverToBoxAdapter(
              child: Row(
                children: <Widget>[
                  Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text('Filter',
                            style: Theme.of(context).textTheme.headline6),
                      ),

                    ]
            )
                    ),

        ],
      ),
    );

  }
}
