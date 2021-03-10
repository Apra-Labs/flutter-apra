import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMarkers extends StatefulWidget {
  @override
  _LocationMarkersState createState() => _LocationMarkersState();
}

class _LocationMarkersState extends State<LocationMarkers> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _initial;
  Set<Marker> _markers = {
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(12.922202223946968, 77.65186943113804),
        infoWindow: InfoWindow(title: "Hii", snippet: "hello")),
    Marker(
        markerId: MarkerId("2"),
        position: LatLng(12.917009554273957, 77.64496609568596),
        infoWindow: InfoWindow(title: "Hii", snippet: "hello")),
    Marker(
        markerId: MarkerId("3"),
        position: LatLng(12.91219847727415, 77.63790853321552),
        infoWindow: InfoWindow(title: "Hii", snippet: "hello")),
    Marker(
        markerId: MarkerId("4"),
        position: LatLng(12.905885963257015, 77.64406219124794),
        infoWindow: InfoWindow(title: "Hii", snippet: "hello")),
    Marker(
        markerId: MarkerId("5"),
        position: LatLng(12.910007939243231, 77.65175174921751),
        infoWindow: InfoWindow(title: "Hii", snippet: "hello")),
    Marker(
        markerId: MarkerId("6"),
        position: LatLng(12.923760003795946, 77.6403708010912),
        infoWindow: InfoWindow(title: "Hii", snippet: "hello")),
  };

  @override
  void initState() {
    _initial = CameraPosition(
      target: LatLng(12.912191941309773, 77.64451783150434),
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
        markers: _markers,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
