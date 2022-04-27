import 'package:latlong2/latlong.dart' as ll;
import 'package:barriolympics/models/marker_type.dart';

class Location {
  const Location({required this.locationName, this.markers = const []});

  final String locationName;
  final List<Map<ll.LatLng, MarkerType>> markers;
}
