import 'package:flutter/material.dart';
import 'package:flutter_apra/theme.dart';

class LinearBar extends StatelessWidget {
  final Color backgroundColor;
  final double percent;
  final String tag;
  final double restrict;

  LinearBar(
      {this.backgroundColor = AppColors.primary,
      @required this.percent,
      this.tag,
      this.restrict});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        tag != null
            ? Text(tag,
                style: TextStyle(
                    fontSize: FontSize.small, color: AppColors.textNormal))
            : Container(),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor,
          ),
          child: Stack(
            fit: StackFit.expand,
            // overflow: Overflow.clip,
            children: [
              FractionallySizedBox(
                  alignment: Alignment.centerRight,
                  widthFactor: 1 - (percent / 100),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Container(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: AppColors.gray,
                        ),
                        child: Center(
                          heightFactor: 1,
                        ),
                      ),
                    ),
                  )),
              Align(
                alignment: Alignment.centerLeft,
                widthFactor: 0.1,
                child: Center(
                  child: Text('${percent.toInt()}%',
                      style: TextStyle(
                          fontSize: FontSize.small,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  heightFactor: 1,
                  widthFactor: 1.5,
                ),
              ),
              restrict == null
                  ? Container()
                  : Positioned(
                      left: MediaQuery.of(context).size.width / 280 * restrict,
                      height: 100,
                      child: SizedBox(
                        width: 3,
                        child: Container(
                          color: Colors.red,
                        ),
                      ))
            ],
          ),
        ),
      ],
    );
  }
}
