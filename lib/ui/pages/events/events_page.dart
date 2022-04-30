import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/components/banner/top_banner.dart';
import 'package:barriolympics/ui/components/event/chip_list.dart';
import 'package:barriolympics/ui/pages/events/event_filter_data.dart';
import 'package:flutter/material.dart';
import 'package:barriolympics/ui/components/event/event_list.dart';
import 'package:barriolympics/ui/pages/events/filter_page.dart';
import 'package:provider/provider.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late EventFilterData _filterData;

  @override
  void initState() {
    super.initState();

    _filterData = EventFilterData(
        user: Provider.of<AppState>(context, listen: false).user);
  }

  void setFilters(EventFilterData filters) {
    setState(() {
      _filterData = filters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          TopBanner(),
          SliverAppBar(
            toolbarHeight: 70,
            backgroundColor: const Color(0xfffdf5f0),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Events',
                        style: Theme.of(context).textTheme.headline6),
                    ChipList(
                        filterData: _filterData, updateFilters: setFilters),
                  ],
                ),
              ),
            ),
          ),
          Consumer<AppState>(builder: (context, state, widget) {
            return EventList(
                events: state.getEvents(_filterData), filters: _filterData);
          }),
          SliverPadding(padding: EdgeInsets.only(bottom: 70)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
          hoverElevation: 1.5,
          shape: StadiumBorder(
              side: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 3)),
          elevation: 1.5,
          foregroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FilterPage(setFilters: this.setFilters)),
            );
          },
          child: const Icon(Icons.filter_alt, size: 30),
      ),
    );
  }
}
