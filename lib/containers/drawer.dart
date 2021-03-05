import 'package:flutter/material.dart';
import 'package:flutter_apra/constants.dart';
import 'package:flutter_apra/controllers/utils.dart';

class NavigationBar extends StatelessWidget {
  final List<DrawerItem> drawerItems = [
    DrawerItem(value: "Expertise", icon: Icons.add, route: AppRoutes.AuthPage),
    DrawerItem(
        value: "Value Proposition", icon: Icons.add, route: AppRoutes.AuthPage),
    DrawerItem(value: "About", icon: Icons.add, route: AppRoutes.AuthPage),
    DrawerItem(value: "Leadership", icon: Icons.add, route: AppRoutes.AuthPage),
    DrawerItem(value: "Products", icon: Icons.add, route: AppRoutes.AuthPage),
    DrawerItem(value: "Jobs", icon: Icons.add, route: AppRoutes.AuthPage),
    DrawerItem(value: "Blog", icon: Icons.add, route: AppRoutes.AuthPage),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width / 1.3,
      child: Column(
        children: [
          DrawerHeader(
              child: Image(
            image: AssetImage("assets/apra_logo.png"),
          )),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: drawerItems.length,
                itemBuilder: (context, index) => drawerItemWidget(
                    context: context, drawerItem: drawerItems[index])),
          )
        ],
      ),
    );
  }

  Widget drawerItemWidget({BuildContext context, DrawerItem drawerItem}) {
    return Column(
      children: [
        ListTile(
          // leading: Icon(drawerItem.icon),
          title: Text(drawerItem.value),
          onTap: () {
            Navigator.of(context).pop();
            RouteUtils.goToPage(context, drawerItem.route);
          },
        ),
        Divider(height: 0),
      ],
    );
  }
}

class DrawerItem {
  final String value;
  final IconData icon;
  final String route;

  DrawerItem({
    this.value,
    this.icon,
    this.route,
  });
}
