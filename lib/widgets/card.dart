import 'package:flutter/material.dart';
import 'package:flutter_apra/theme.dart';

class AppCard extends StatelessWidget {
  final Widget body;
  final double padding;
  final double borderRadius;
  final double elevation;
  final Color color;

  AppCard(
      {@required this.body,
      this.padding = 10,
      this.elevation = 5,
      this.color = AppColors.light,
      this.borderRadius = 15.0});

  @override
  Card build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: body,
        ),
      ),
    );
  }
}
