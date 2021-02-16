import 'package:flutter/material.dart';
import 'package:flutter_apra/constants.dart';
import 'package:flutter_apra/providers/bottom_actionbar_provider.dart';
import 'package:flutter_apra/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomActionBar extends StatelessWidget {
  final List<IconItem> navConfig = [
    IconItem(icon: Icons.person, text: PageTitles.Profile),
    IconItem(icon: Icons.home, text: PageTitles.Home),
    IconItem(icon: Icons.settings, text: PageTitles.Settings),
  ];

  final List<BottomNavigationBarItem> navItems = [];

  @override
  Widget build(BuildContext context) {
    navConfig.forEach((element) {
      navItems.add(BottomNavigationBarItem(
          icon: Icon(element.icon), label: element.text));
    });
    return Consumer(builder: (context, watch, _) {
      final bottomIndex = watch(bottomIndexProvider.state);
      return BottomNavigationBar(
        items: navItems,
        currentIndex: bottomIndex,
        selectedItemColor: AppColors.secondary,
        backgroundColor: AppColors.primary,
        unselectedItemColor: AppColors.actionbar,
        onTap: (index) =>
            context.read(bottomIndexProvider).setBottomIndex(index),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      );
    });
  }
}

class IconItem {
  String text;
  IconData icon;

  IconItem({@required this.icon, @required this.text});
}
