import 'package:flutter/material.dart';
import 'package:flutter_apra/constants.dart';
import 'package:flutter_apra/containers/application_page.dart';
import 'package:flutter_apra/controllers/utils.dart';
import 'package:flutter_apra/widgets/alert.dart';
import 'package:flutter_apra/widgets/buttons.dart';
import 'package:flutter_apra/widgets/rangeslider.dart';
import 'package:flutter_apra/widgets/textinput.dart';

class DialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      title: PageTitles.Dialogs,
      body: Column(
        children: [

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
                      body: AppRangeSlider(
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
                      onAccept: () {},
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
        ],
      ),
      
    );
  }
}