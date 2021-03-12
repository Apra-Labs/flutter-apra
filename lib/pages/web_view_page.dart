import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_apra/containers/application_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String title;
  final String url;

  WebViewPage({this.title = "", this.url = "https://apralabs.com/"});
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      title: widget.title,
      appBarBackgroundColor: Colors.transparent,
      padding: EdgeInsets.zero,
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
