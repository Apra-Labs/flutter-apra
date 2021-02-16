import 'package:flutter/material.dart';
import 'package:flutter_apra/constants.dart';
import 'package:flutter_apra/containers/application_page.dart';
import 'package:flutter_apra/theme.dart';
import 'package:flutter_apra/widgets/card.dart';
import 'package:flutter_apra/widgets/textinput.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQr extends StatefulWidget {
  @override
  _GenerateQrState createState() => _GenerateQrState();
}

class _GenerateQrState extends State<GenerateQr> {
  String qrData = "www.apralabs.com";
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      title: PageTitles.QRCode,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/apra_logo.png"),
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: AppCard(
                elevation: 2,
                borderRadius: 5.0,
                padding: 5,
                body: QrImage(
                  data: qrData,
                  version: QrVersions.auto,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextInput(
              onChange: (str) {
                setState(() {
                  qrData = str;
                });
              },
              value: qrData,
              fillColor: AppColors.gray2,
            ),
          ],
        ),
      ),
    );
  }
}
