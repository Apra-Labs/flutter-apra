import 'package:flutter/material.dart';
import 'package:flutter_apra/containers/bottom_actionbar.dart';
import 'package:flutter_apra/containers/fab.dart';

class ApplicationPage extends StatelessWidget {
  final String title;
  final bool showFab;
  final bool showBottomNavigationBar;
  final Widget body;
  final EdgeInsetsGeometry padding;
  final List<Widget> actions;
  final Color backgroundColor;
  final double toolbarHeight;
  final LinearGradient gradient;
  final Color appBarBackgroundColor;
  final bool centerTitle;
  final bool extendBodyBehindAppBar;
  final bool safeArea;
  final double elevation;

  ApplicationPage(
      {this.title,
      @required this.body,
      this.showBottomNavigationBar = false,
      this.actions = const [],
      this.showFab = false,
      this.backgroundColor = Colors.white,
      this.padding = const EdgeInsets.all(20),
      this.toolbarHeight = kToolbarHeight,
      this.appBarBackgroundColor,
      this.centerTitle = false,
      this.extendBodyBehindAppBar = false,
      this.safeArea = false,
      this.elevation = 0,
      this.gradient});

  @override
  Widget build(BuildContext context) {
    return safeArea
        ? SafeArea(child: scaffoldWidget(context))
        : scaffoldWidget(context);
  }

  Scaffold scaffoldWidget(BuildContext context) {
    return Scaffold(
      appBar: title != null
          ? AppBar(
              title: Text(title),
              actions: actions,
              backgroundColor: appBarBackgroundColor,
              toolbarHeight: toolbarHeight,
              centerTitle: centerTitle,
              elevation: elevation,
            )
          : null,
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: Container(
        child: body,
        decoration: BoxDecoration(gradient: gradient),
        padding: padding,
      ),
      floatingActionButton: showFab ? FloatingButton() : null,
      bottomNavigationBar: showBottomNavigationBar ? BottomActionBar() : null,
    );
  }
}
