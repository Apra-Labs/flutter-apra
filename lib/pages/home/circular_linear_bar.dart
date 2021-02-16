import 'package:flutter/material.dart';
import 'package:flutter_apra/constants.dart';
import 'package:flutter_apra/containers/application_page.dart';
import 'package:flutter_apra/widgets/circularbar.dart';
import 'package:flutter_apra/widgets/linearbar.dart';

class CircularLinearBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      title: PageTitles.CircularLinearBar,
      body: Column(
        children: [
          CircularBar(
            tag: "WIFI",
            percent: 0.7,
            restrict: 25,
          ),
          SizedBox(
            height: 10,
          ),
          CircularBar(
            tag :"Bluetooth",
            percent: 0.4,
            restrict: 50,
          ),
          SizedBox(
            height: 20,
          ),
          LinearBar(
            percent: 25,
            tag: "Download",
          ),
          SizedBox(
            height: 20,
          ),
          LinearBar(
            percent: 58,
            tag: "Download",
          ),
        ],
      ),
    );
  }
}
