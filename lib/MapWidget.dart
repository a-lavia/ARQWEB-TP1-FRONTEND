import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  static const LatLng _defaultPosition = LatLng(-34.6021521, -58.4345179);

  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _markers = Set.of(<Marker>[
    Marker(
        markerId: MarkerId("DefaultPos"),
        position: _defaultPosition,
        infoWindow: InfoWindow(title: 'Locación elegida'))
  ]);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: _defaultPosition,
    zoom: 12.0,
  );

  LatLng getLatLng() {
    return _markers.first.position;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      onTap: (LatLng pos) {
        setState(() {
          _markers.clear();
          _markers.add(Marker(
              markerId: MarkerId(pos.toString()),
              position: pos,
              infoWindow: InfoWindow(title: 'Locación elegida')));
        });
      },
      markers: _markers,
    );
  }
}
