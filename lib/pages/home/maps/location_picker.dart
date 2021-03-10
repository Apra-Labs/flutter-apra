import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_apra/theme.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPicker extends StatefulWidget {
  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _initial;
  LatLng latlng;

  @override
  void initState() {
    latlng = LatLng(12.912191941309773, 77.64451783150434);
    _initial = CameraPosition(
      target: latlng,
      zoom: 16,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Stack(
          children: [
            Container(
              child: GoogleMap(
                zoomGesturesEnabled: true,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                initialCameraPosition: _initial,
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onCameraMove: (CameraPosition cameraPosition) {
                  setState(() {
                    latlng = LatLng(cameraPosition.target.latitude,cameraPosition.target.longitude);
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: Center(
                child: Icon(
                  Icons.location_on_sharp,
                  color: AppColors.danger,
                  size: 50,
                ),
              ),
            )
          ],
        )),
        Container(
          height: 100,
          alignment: Alignment.center,
          child: Text("Latitiude: ${latlng.latitude}\nLongitude: ${latlng.longitude}"),
        )
      ],
    );
  }
}
