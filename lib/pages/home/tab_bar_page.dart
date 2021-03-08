import 'package:flutter/material.dart';
import 'package:flutter_apra/containers/bottom_actionbar.dart';
import 'package:flutter_apra/pages/home/maps/maps_demo.dart';

class TabBarPage extends StatelessWidget {
  final List<IconItem> tabs = [
    IconItem(icon: Icons.favorite, text: "Maps"),
    IconItem(icon: Icons.access_time, text: "Picker"),
    IconItem(icon: Icons.contact_page, text: "Marker"),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tabs"),
          bottom: TabBar(
            onTap: (selectedTab) {
              print(selectedTab);
            },
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
            children: List<Widget>.generate(tabs.length, (index) {
          if (index == 0) return MapsPage(index);
          return Icon(tabs[index].icon);
        })),
      ),
    );
  }
}
