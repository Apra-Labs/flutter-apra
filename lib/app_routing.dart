import 'package:flutter/material.dart';
import 'package:flutter_apra/constants.dart';
import 'package:flutter_apra/pages/home/auth_page.dart';
import 'package:flutter_apra/pages/home/circular_linear_bar.dart';
import 'package:flutter_apra/pages/home/dialogs.dart';
import 'package:flutter_apra/pages/home/edit_text_field.dart';
import 'package:flutter_apra/pages/home/generate_qr.dart';
import 'package:flutter_apra/pages/home/gradient_page.dart';
import 'package:flutter_apra/pages/home/network_page.dart';
import 'package:flutter_apra/pages/home/scan_qr.dart';
import 'package:flutter_apra/pages/home/tab_bar_page.dart';
import 'package:flutter_apra/pages/root.dart';
import 'package:flutter_apra/splash_screen.dart';
import 'package:flutter_apra/theme.dart';

class AppRouting extends StatelessWidget {
  @override
  MaterialApp build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        accentColor: AppColors.secondary,
        buttonColor: AppColors.primary,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.SplashScreen,
      routes: {
        AppRoutes.SplashScreen: (context) => SplashScreen(),
        AppRoutes.RootPage: (context) => RootPage(),
        AppRoutes.AuthPage: (context) => AuthPage(),
        AppRoutes.NetworkPage: (context) => NetworkPage(),
        AppRoutes.TabBarPage: (context) => TabBarPage(),
        AppRoutes.EditTextField: (context) => EditTextField(),
        AppRoutes.GradientPage: (context) => GradientPage(),
        AppRoutes.ScanQr: (context) => ScanQr(),
        AppRoutes.GenerateQr: (context) => GenerateQr(),
        AppRoutes.CircularLinearBar: (context) => CircularLinearBar(),
        AppRoutes.Dialogs: (context) => DialogPage(),
      },
    );
  }
}
