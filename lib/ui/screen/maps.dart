import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class ViewMap extends StatelessWidget {
  num latitude;
  num longitude;
  ViewMap({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buidMap() {}

    return Scaffold(
        // body: FlutterMap(
        //     options: MapOptions(
        //   center:
        // )),
        );
  }
}
