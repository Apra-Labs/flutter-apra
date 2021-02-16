import 'package:flutter/material.dart';
import 'package:flutter_apra/theme.dart';

class Gradients {
  static LinearGradient get gradient1 => LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.2,
            0.4
          ],
          colors: [
            AppColors.light,
            AppColors.primary,
          ]);

  static LinearGradient get gradient2 => LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.5,
            0.75
          ],
          colors: [
            Color.fromRGBO(95, 113, 199, 1),
            Color.fromRGBO(71, 171, 210, 1)
          ]);
}
