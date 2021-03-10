import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _initial;

  @override
  void initState() {
    _initial = CameraPosition(
      target: LatLng(12.9122389,77.6443565),
      zoom: 16,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        zoomGesturesEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: _initial,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
