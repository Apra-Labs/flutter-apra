import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_apra/keys.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Directions extends StatefulWidget {
  @override
  _DirectionsState createState() => _DirectionsState();
}

class _DirectionsState extends State<Directions> {
  Completer<GoogleMapController> _controller = Completer();
  PolylinePoints _polylinePoints;
  List<LatLng> polylineCoordinates = [];

  LatLng _source = LatLng(12.91219847727415, 77.63790853321552);
  LatLng _desitination = LatLng(12.905885963257015, 77.64406219124794);

  CameraPosition _initial;
  final Set<Marker> _markers = {};
  final Set<Polyline> polyline = {};

  @override
  void initState() {
    _initial = CameraPosition(
      target: LatLng(12.912191941309773, 77.64451783150434),
      zoom: 15.2,
    );
    _markers.add(
      Marker(
          markerId: MarkerId("1"),
          position: _source,
          infoWindow: InfoWindow(title: "Source")),
    );
    _markers.add(
      Marker(
          markerId: MarkerId("2"),
          position: _desitination,
          infoWindow: InfoWindow(title: "Destination")),
    );
    createPolyLines(_source, _desitination,);
    super.initState();
  }

  void createPolyLines(LatLng start, LatLng destination) async {
    _polylinePoints = PolylinePoints();
    PolylineResult polylineResult =
        await _polylinePoints.getRouteBetweenCoordinates(
            Keys.API_KEY,
            PointLatLng(start.latitude, start.longitude),
            PointLatLng(destination.latitude, destination.longitude));
    if (polylineResult.points.isNotEmpty) {
      polylineResult.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    setState(() {
      polyline.add(Polyline(
          polylineId: PolylineId("poly1"),
          color: Colors.black,
          points: polylineCoordinates,
          width: 3));
    });
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
        polylines: polyline,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
