import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  @override
  FloatingActionButton build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}
