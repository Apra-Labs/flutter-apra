import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_apra/constants.dart';
import 'package:flutter_apra/controllers/utils.dart';
import 'package:flutter_apra/theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),
        () => RouteUtils.setRootPage(context, AppRoutes.RootPage));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Center(
            child: Image(
          image: AssetImage("assets/apra_logo.png"),
        )),
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
