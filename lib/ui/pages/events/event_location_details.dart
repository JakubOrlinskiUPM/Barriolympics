import 'package:flutter/material.dart';

import 'package:barriolympics/models/event.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as ll;

class EventLocationDetails extends StatelessWidget {
  const EventLocationDetails(
      {Key? key, required this.style, required this.event})
      : super(key: key);

  final TextStyle style;
  final Event event;

  @override
  Widget build(BuildContext context) {
    ll.LatLng latLng = event.location!.markers[0].keys.first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location:",
          style: style,
        ),
        SizedBox(
          height: 300,
          child: FlutterMap(
            options: MapOptions(
              center: latLng,
              zoom: 13.0,
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
              MarkerLayerOptions(
                markers: [
                  ...event.location!.markers
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
      ],
    );
  }
}
