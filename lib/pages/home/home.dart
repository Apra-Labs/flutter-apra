import 'package:flutter/material.dart';
import 'package:flutter_apra/controllers/utils.dart';
import 'package:flutter_apra/widgets/buttons.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryItems = Utils.categoryItemsList;
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: categoryItems.length,
        itemBuilder: (context, index) => buttonWidget(
            context: context, categoryItem: categoryItems[index]));
  }

  Widget buttonWidget({BuildContext context, CategoryItem categoryItem}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Button(
          label: categoryItem.value,
          onPressed: () {
            RouteUtils.goToPage(context, categoryItem.route);
          }),
    );
  }
}
