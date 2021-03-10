import 'package:flutter/material.dart';
import 'package:flutter_apra/containers/bottom_actionbar.dart';
import 'package:flutter_apra/pages/home/maps/directions.dart';
import 'package:flutter_apra/pages/home/maps/location_marker.dart';
import 'package:flutter_apra/pages/home/maps/location_picker.dart';
import 'package:flutter_apra/pages/home/maps/maps_demo.dart';

class TabBarPage extends StatelessWidget {
  final List<IconItem> tabs = [
    IconItem(icon: Icons.location_on, text: "  Maps  "),
    IconItem(icon: Icons.add_location, text: "  Picker  "),
    IconItem(icon: Icons.add_location_alt, text: "Markers"),
    IconItem(icon: Icons.directions, text: "Directions"),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Maps Demo"),
          bottom: TabBar(
            onTap: (selectedTab) {},
            isScrollable: true,
            tabs: List<Tab>.generate(
                tabs.length,
                (index) => Tab(
                      icon: Icon(tabs[index].icon),
                      text: tabs[index].text,
                    )),
          ),
        ),
        body: TabBarView(
            physics: NeverScrollableScrollPhysics(),

            ///Remove this to make scrollable
            children: List<Widget>.generate(tabs.length, (index) {
              switch (index) {
                case 0:
                  return MapsPage();
                case 1:
                  return LocationPicker();
                case 2:
                  return LocationMarkers();
                case 3:
                  return Directions();
                default:
                  return Container();
              }
            })),
      ),
    );
  }
}
