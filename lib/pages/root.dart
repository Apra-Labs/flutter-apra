import 'package:flutter/material.dart';
import 'package:flutter_apra/constants.dart';
import 'package:flutter_apra/containers/application_page.dart';
import 'package:flutter_apra/providers/bottom_actionbar_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home/home.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      title: PageTitles.ApraLabs,
      centerTitle: true,
      padding: EdgeInsets.zero,
      body: Consumer(builder: (context, watch, _) {
        final bottomIndex = watch(bottomIndexProvider.state);
        return getRootWidget(bottomIndex);
      }),
      showBottomNavigationBar: true,
    );
  }

  Widget getRootWidget(int index) {
    switch (index) {
      case 0:
        return Container(
          child: Center(child: Text("Profile")),
        );
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
}
