import 'package:flutter/material.dart';
import 'package:flutter_apra/constants.dart';
import 'package:flutter_apra/controllers/utils.dart';
import 'package:flutter_apra/theme.dart';
import 'package:flutter_apra/widgets/alert.dart';
import 'package:flutter_apra/widgets/buttons.dart';
import 'package:flutter_apra/widgets/rangeslider.dart';
import 'package:flutter_apra/widgets/textinput.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Button(
                label: "Authentication",
                onPressed: () {
                  RouteUtils.goToPage(context, AppRoutes.AuthPage);
                }),
            SizedBox(
              height: 20,
            ),
            Button(
                label: "Network Service",
                onPressed: () {
                  RouteUtils.goToPage(context, AppRoutes.NetworkPage);
                }),
            SizedBox(
              height: 20,
            ),
            Button(
                label: "Edit & Text Fields",
                onPressed: () {
                  RouteUtils.goToPage(context, AppRoutes.EditTextField);
                }),
            SizedBox(
              height: 20,
            ),
            Button(
                label: "Gradient Screen",
                onPressed: () {
                  RouteUtils.goToPage(context, AppRoutes.GradientPage);
                }),
            SizedBox(
              height: 20,
            ),
            Button(
                label: "Qr Scanner",
                onPressed: () {
                  RouteUtils.goToPage(context, AppRoutes.ScanQr);
                }),
            SizedBox(
              height: 20,
            ),
            Button(
                label: "Qr Generator",
                onPressed: () {
                  RouteUtils.goToPage(context, AppRoutes.GenerateQr);
                }),
            SizedBox(
              height: 20,
            ),
            Button(
                label: "Circular & Linear Bar",
                onPressed: () {
                  RouteUtils.goToPage(context, AppRoutes.CircularLinearBar);
                }),
            SizedBox(
              height: 20,
            ),
            Button(
              label: "Message popup",
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return Alert(
                        onAccept: () {
                          RouteUtils.goBack(context);
                        },
                        title: "Message",
                        body: TextInput(
                          onChange: (s) {
                            print(s);
                          },
                          placeholder: "Type message",
                          rows: 3,
                        ),
                        denyLabel: "Cancel",
                        acceptLabel: "Send",
                      );
                    });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              label: "Range popup",
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return Alert(
                        onAccept: () {},
                        title: "Range popup",
                        // message: "Are you sure to extend venue",
                        body: ApppRangeSlider(
                          onChange: (x) {},
                        ),
                        denyLabel: "No",
                        acceptLabel: "Yes",
                      );
                    });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              label: "List popup",
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return Alert(
                        onAccept: () {
                        },
                        title: "List popup",
                        message: "Message",
                        body: Container(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text("1"),
                              Divider(
                                height: 20,
                              ),
                              Text("2"),
                              Divider(
                                height: 20,
                              ),
                              Text("3"),
                              Divider(
                                height: 20,
                              ),
                              Text("4"),
                            ],
                          ),
                        ),
                        denyLabel: "Close",
                        acceptLabel: "Ok",
                      );
                    });
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );
  }
}
