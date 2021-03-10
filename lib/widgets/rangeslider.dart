import 'package:flutter/material.dart';
import 'package:flutter_apra/theme.dart';

class ApppRangeSlider extends StatefulWidget {
  final Function(double) onChange;
  final int step;
  final double max;
  final double min;
  final double defaultValue;
  final Color color;

  ApppRangeSlider(
      {@required this.onChange,
      this.max,
      this.min,
      this.step,
      this.defaultValue,
      this.color});

  @override
  _ApppRangeSlider createState() => _ApppRangeSlider(
      max: max,
      min: min,
      onChange: onChange,
      step: step,
      defaultValue: defaultValue,
      color: color);
}

class _ApppRangeSlider extends State<ApppRangeSlider> {
  double value = 0;
  double defaultValue;
  Function(double) onChange;
  int step;
  double max;
  double min;
  Color color;

  _ApppRangeSlider(
      {@required this.onChange,
      @required this.max,
      @required this.min,
      @required this.step,
      @required this.defaultValue,
      @required this.color}) {
    onChange ??= (x) {};
    max ??= 100;
    min ??= 0;
    step ??= 1;
    defaultValue ??= 0;
    color ??= AppColors.positive;
    value = defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      min: min,
      max: max,
      divisions: ((max - min) / step).round(),
      label: value.round().toString(),
      inactiveColor: AppColors.gray2,
      onChanged: (double v) {
        setState(() {
          value = v;
        });
      },
      activeColor: color,
    );
  }
}
