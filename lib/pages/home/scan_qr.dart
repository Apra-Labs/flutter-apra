import 'package:flutter/material.dart';
import 'package:flutter_apra/containers/application_page.dart';
import 'package:flutter_apra/controllers/utils.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../theme.dart';

class ScanQr extends StatefulWidget {
  @override
  _ScanQrState createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController qrViewController;
  bool flashStatus = false;

  String qrData = '';

  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      padding: EdgeInsets.all(0),
      body: Stack(children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                    overlayColor: Color.fromRGBO(0, 0, 0, 30),
                    borderRadius: 0,
                    borderLength: 150,
                    borderWidth: 5,
                    borderColor: AppColors.positive),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: AppColors.actionbar,
                padding: EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text(qrData),
                        ),
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: new BoxDecoration(
                        color:
                            flashStatus ? AppColors.danger : AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          flashStatus ? Icons.flash_off : Icons.flash_on,
                          size: 30,
                          color: AppColors.gray2,
                        ),
                        onPressed: () async {
                          qrViewController.toggleFlash();
                          bool status = await qrViewController.getFlashStatus();
                          setState(() {
                            flashStatus = status;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        RouteUtils.goBack(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrData = scanData.code;
      });
    });
  }
}
