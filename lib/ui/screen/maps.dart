import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:latlng/latlng.dart';
import 'package:latlong2/latlong.dart';

class ViewMap extends StatelessWidget {
  final num latitude;
  final num longitude;
  const ViewMap({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
          options: MapOptions(
              center: LatLng(latitude.toDouble(), longitude.toDouble()),
              minZoom: 13.0),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(markers: [
              Marker(
                  point: LatLng(latitude.toDouble(), longitude.toDouble()),
                  builder: (context) => const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 35,
                      ))
            ])
          ]),
    );
  }
}
