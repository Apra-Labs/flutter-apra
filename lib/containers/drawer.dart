import 'package:flutter/material.dart';
import 'package:flutter_apra/controllers/utils.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drawerItems = Utils.categoryItemsList;

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

  Widget drawerItemWidget({BuildContext context, CategoryItem drawerItem}) {
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
