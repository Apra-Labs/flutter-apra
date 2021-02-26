import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_apra/constants.dart';
import 'package:flutter_apra/controllers/utils.dart';
import 'package:flutter_apra/theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInCubic);

    _controller.forward();

    Timer(Duration(seconds: 4),
        () => RouteUtils.setRootPage(context, AppRoutes.RootPage));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        ScaleTransition(
          scale: _animation,
          child: Center(
              child: Image(
            image: AssetImage("assets/apra_logo.png"),
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "\u00a9 Apra Labs Private Limited",
              style: TextStyle(
                color: AppColors.primary,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
