import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:user_location/user_location.dart';

class Map extends StatelessWidget {
  MapController mapController = MapController();
  UserLocationOptions userLocationOptions;
   List<Marker> markers = [];
 
  // @override
  Widget build(BuildContext context) {
    userLocationOptions = UserLocationOptions(
                context: context,
                mapController: mapController,
                markers: markers,
                zoomToCurrentLocationOnLoad: true,
                showMoveToCurrentLocationFloatingActionButton: true;
                );

    return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(51.5, -0.09),
        zoom: 13.0,
        plugins: [
          UserLocationPlugin(),
        ],
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c']
        ),
        new MarkerLayerOptions( markers: markers ),
        userLocationOptions,
      ],
    );
  }
}