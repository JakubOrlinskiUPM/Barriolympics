import 'package:barriolympics/provider/app_state.dart';
import 'package:barriolympics/ui/pages/events/event_filter_data.dart';
import 'package:flutter/material.dart';
import 'package:barriolympics/ui/components/top_banner.dart';
import 'package:barriolympics/ui/components/event/event_list.dart';
import 'package:barriolympics/ui/components/post/like_button.dart';
import 'package:barriolympics/ui/pages/events/filter_page.dart';
import 'package:provider/provider.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  EventFilterData _filterData = EventFilterData();
  Map _chipsSelected = {
    "Art": false,
    "Music": false,
    "Food": false,
  };

  void chipSelected(bool selected, String key) {
    setState(() {
      _chipsSelected[key] = selected;
    });
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
          const TopBanner(),
          SliverAppBar(
            pinned: true,
            backgroundColor: const Color(0xfffdf5f0),
            title: Row(
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
                        MaterialPageRoute(
                            builder: (context) =>
                                FilterPage(setFilters: this.setFilters)),
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
              ],
            ),
            flexibleSpace: Row(
              children: [
                if (_filterData.startDate != null) ...[
                  Chip(
                    avatar: Icon(Icons.calendar_today),
                    deleteIcon: Icon(Icons.highlight_remove),
                    onDeleted: () => {},
                    backgroundColor: Colors.grey.shade400,
                    label: Text(_filterData.startDate!.day.toString() +
                        "-" +
                        _filterData.startDate!.month.toString()),
                  ),
                ],
                Row(
                  children: _chipsSelected.entries.map((entry) {
                    return FilterChip(
                      selected: entry.value,
                      label: Text(entry.key),
                      onSelected: (selected) =>
                          chipSelected(selected, entry.key),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Consumer<AppState>(builder: (context, state, widget) {
            return EventList(events: state.barrio.events, filters: _filterData);
          })
        ],
      ),
    );
  }
}
