import 'package:barriolympics/models/event.dart';
import 'package:barriolympics/models/location.dart';
import 'package:barriolympics/models/marker_type.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step.dart';
import 'package:barriolympics/ui/pages/new_event/edit_event_step_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as ll;
import 'package:osm_nominatim/osm_nominatim.dart' as nm;

class EditEventStepLoc extends StatefulWidget implements EditEventStep {
  const EditEventStepLoc({
    Key? key,
    required this.event,
    required this.nextStep,
    required this.previousStep,
  }) : super(key: key);

  final Event event;
  final Function nextStep;
  final Function previousStep;

  @override
  State<EditEventStepLoc> createState() => _EditEventStepLocState();

  IconData getIcon() {
    return Icons.map;
  }

  String getTitle() {
    return "Location";
  }
}

class _EditEventStepLocState extends State<EditEventStepLoc> {
  String locationName = "";
  MapController mapController = MapController();
  List<Map<ll.LatLng, MarkerType>> markers = [];
  List<MarkerType> markerTypes = [
    MarkerType(label: "Main event", color: Colors.red),
    MarkerType(label: "Meeting point", color: Colors.green),
    MarkerType(label: "Sellers", color: Colors.blue),
  ];
  int? typeIndex;
  ll.LatLng? searchResult;
  Location? location;
  bool showSearch = false;

  @override
  void initState() {
    super.initState();
    location = widget.event.location ?? Location(locationName: '');
    markers = location?.markers.toList() ?? [];
  }

  void lookupAddress(String query) async {
    final List<nm.Place> result = await nm.Nominatim.searchByName(
      query: query,
      limit: 5,
      addressDetails: true,
      extraTags: true,
      nameDetails: true,
    );

    if (result.length > 0) {
      ll.LatLng res = ll.LatLng(result[0].lat, result[0].lon);
      setState(() {
        searchResult = res;
      });
      mapController.move(res, 15);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: "Enter the address of the event here...",
                prefixIcon: Icon(Icons.pin_drop)),
            onChanged: (String val) {
              setState(() {
                this.locationName = val;
              });
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                center: ll.LatLng(40.416661, -3.703533),
                zoom: 11.0,
                onTap: (_, ll.LatLng lng) {
                  if (typeIndex != null) {
                    setState(() {
                      markers.add({lng: markerTypes[typeIndex!]});
                    });
                  }
                },
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                  attributionBuilder: (_) {
                    return Text("© OpenStreetMap contributors");
                  },
                ),
                CircleLayerOptions(
                  circles: [
                    if (searchResult != null) ...[
                      CircleMarker(
                        point: searchResult!,
                        color: Colors.red.withOpacity(0.3),
                        borderStrokeWidth: 3.0,
                        borderColor: Colors.red,
                        radius: 10,
                      ),
                    ],
                  ],
                ),
                MarkerLayerOptions(
                  markers: [
                    ...markers
                        .map(
                          (marker) => Marker(
                            width: 40.0,
                            height: 40.0,
                            point: marker.keys.first,
                            builder: (ctx) => Container(
                              child: Icon(
                                Icons.pin_drop,
                                color: marker.values.first.color,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: markerTypes.map((markerType) {
              ButtonStyle style = ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0))),
              );
              if (typeIndex != null && markerTypes[typeIndex!] == markerType) {
                style = ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(markerType.color.withAlpha(40)),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
                );
              }
              int markersOfType = markers
                  .where((marker) => marker.values.first == markerType)
                  .toList()
                  .length;
              return OutlinedButton.icon(
                style: style,
                onPressed: () {
                  setState(() {
                    typeIndex = markerTypes.indexOf(markerType);
                  });
                },
                icon: Icon(
                  Icons.pin_drop,
                  color: markerType.color,
                ),
                label: Text(markerType.label + " (${markersOfType})"),
              );
            }).toList(),
          ),
        ),
        showSearch
            ? Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Search for an address here...",
                      prefixIcon: Icon(Icons.search)),
                  onFieldSubmitted: lookupAddress,
                ),
              )
            : OutlinedButton.icon(
                onPressed: () {
                  setState(() {
                    showSearch = true;
                  });
                },
                icon: Icon(Icons.search_outlined),
                label: Text("Search for an address"),
              ),
        EditEventStepNavigation(
          isSaveEnabled: _isSaveEnabled(),
          previousStep: () {
            widget.previousStep();
          },
          index: 1,
          nextStep: this._saveStep,
        ),
      ],
    );
  }

  bool _isSaveEnabled() {
    return markers.length > 0 && locationName.length > 0;
  }

  void _saveStep() {
    widget.event.location =
        Location(locationName: locationName, markers: markers);
    widget.nextStep();
  }
}
