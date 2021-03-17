import 'package:flutter/material.dart';
import 'package:flutter_apra/constants.dart';
import 'package:flutter_apra/containers/application_page.dart';
import 'package:flutter_apra/pages/profile/profile.dart';
import 'package:flutter_apra/providers/bottom_actionbar_provider.dart';
import 'package:flutter_apra/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home/home.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      final bottomIndex = watch(bottomIndexProvider.state);
      return ApplicationPage(
        title: PageTitles.ApraLabs,
        titleTextStyle: TextStyle(
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.bold,
            fontSize: FontSize.large),
        showSideNavigationBar: showSideNavigationBar(bottomIndex),
        centerTitle: true,
        padding: EdgeInsets.zero,
        body: getRootWidget(bottomIndex),
        showBottomNavigationBar: true,
      );
    });
  }

  Widget getRootWidget(int index) {
    switch (index) {
      case 0:
        return Profile();
      case 1:
        return Home();
      case 2:
        return Container(
          child: Center(child: Text("Settings")),
        );
      default:
        return Container();
    }
  }

  bool showSideNavigationBar(int index){
    switch (index) {
      case 0:
        return false;
      case 1:
        return true;
      case 2:
        return false;
      default:
        return false;
    }
  }
}
