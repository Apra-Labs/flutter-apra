import 'package:flutter/material.dart';
import 'package:flutter_apra/theme.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularBar extends StatelessWidget {
  final Color progressColor;
  final Color backgroundColor;
  final String tag;
  final double percent;
  final double radius;
  final bool reverse;
  final String header;
  final double restrict;

  CircularBar(
      {this.progressColor = AppColors.primary,
      this.backgroundColor = AppColors.actionbar,
      this.tag,
      @required this.percent,
      this.radius = 150.0,
      this.reverse = false,
      this.restrict = 0,
      this.header});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text(
                  header,
                  style: TextStyle(
                      color: AppColors.textNormal,
                      fontSize: FontSize.small,
                      fontWeight: FontWeight.bold),
                ),
              )
            : Container(),
        Stack(
          children: [
            new CircularPercentIndicator(
              radius: radius,
              lineWidth: radius / 15,
              animation: true,
              backgroundColor: backgroundColor,
              reverse: reverse,
              backgroundWidth:
                  header != null ? ((radius / 10) - 5) : ((radius / 10) + 5),
              percent: percent,
              center: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  tag != null
                      ? Text(tag,
                          style: TextStyle(
                              fontSize: FontSize.normal,
                              color: AppColors.textNormal))
                      : Container(),
                  new Text(
                    "${(percent * 100).round()}%",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.medium,
                        color: progressColor),
                  ),
                ],
              ),
              startAngle: 180.0,
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: (percent * 100) <= restrict
                  ? AppColors.danger
                  : progressColor,
            ),
            Positioned(
              child: Container(
                width: radius / 7,
                // color: Colors.red,
                height: radius / 7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (percent * 100) <= restrict
                        ? AppColors.danger
                        : progressColor),
              ),
              bottom: 0,
              left: header != null ? (radius / 2.9) : (radius / 2.4),
            ),
            header == null && restrict != null
                ? Positioned(
                    child: new CircularPercentIndicator(
                      radius: radius,
                      lineWidth: radius / 10,
                      animation: false,
                      backgroundColor: Colors.transparent,
                      backgroundWidth: 20,
                      percent: 0.01,
                      startAngle: (restrict * 3.6) + 180,
                      circularStrokeCap: CircularStrokeCap.butt,
                      progressColor: Colors.red,
                    ),
                  )
                : Container()
          ],
        ),
      ],
    );
  }
}
