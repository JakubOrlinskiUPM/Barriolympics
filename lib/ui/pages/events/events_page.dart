import 'package:flutter/material.dart';
import 'package:barriolympics/ui/components/top_banner.dart';
import 'package:barriolympics/ui/components/event/event_list.dart';
import 'package:barriolympics/ui/components/post/like_button.dart';
import 'package:barriolympics/ui/pages/events/filter_page.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const TopBanner(),
          // const SliverAppBar(
          //     pinned: true,
          //   title:
          //
          // ),
          SliverToBoxAdapter(
              child: Row(
                children: <Widget>[
                  Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text('Events',
                            style: Theme.of(context).textTheme.headline6),
                      ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FilterPage()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.filter_alt, size: 15),
                          Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Text(
                              'Filter',
                              style: TextStyle(height: 1.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                 

                    ]
            )
                    ),



           const EventList(),
        ],
      ),
    );

  }
}
