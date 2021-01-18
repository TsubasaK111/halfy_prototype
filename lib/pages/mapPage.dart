import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:user_location/user_location.dart';

import 'package:halfy_prototype/pages/tiktokPage.dart';

class MapPage extends StatelessWidget {
  static const String route = '/map';

  MapController mapController = MapController();
  UserLocationOptions userLocationOptions;
  StreamController<LatLng> markerlocationStream = StreamController();
  List<Marker> markers = [];

  // @override
  Widget build(BuildContext context) {
    markerlocationStream.stream.listen((onData) {
      // do nothing.
      // print(onData.latitude, onData.longitude);
    });
    userLocationOptions = UserLocationOptions(
      context: context,
      mapController: mapController,
      markers: markers,
      showMoveToCurrentLocationFloatingActionButton: true,
      // updateMapLocationOnPositionChange: true,
      zoomToCurrentLocationOnLoad: true,
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('supz'),
          actions: [
            IconButton(
              icon: Icon(Icons.list, size: 32),
              onPressed: () {
                Navigator.pushNamed(context, TikTokPage.route);
              },
            )
          ],
        ),
        body: FlutterMap(
          options: MapOptions(
            center: LatLng(35.652832, 139.839478),
            zoom: 9.0,
            plugins: [
              UserLocationPlugin(),
            ],
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(markers: markers),
            userLocationOptions,
          ],
          mapController: mapController,
        ));
  }

  void dispose() {
    markerlocationStream.close();
  }
}
