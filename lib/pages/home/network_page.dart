import 'package:flutter/material.dart';
import 'package:flutter_apra/constants.dart';
import 'package:flutter_apra/containers/application_page.dart';
import 'package:flutter_apra/widgets/buttons.dart';

class NetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      title: PageTitles.Network,
      centerTitle: true,
      body: Column(
        children: [
          Button(
              label: "GET",
              onPressed: () async {
                // await NetworkUtils().networkRequest(Method.get, "/todos/1",
                //     onSuccess: (data) {
                //   print(data);
                // }, onError: (int code, String msg) {
                //   print(code);
                //   print(msg);
                // });
              }),
          SizedBox(
            height: 10,
          ),
          Button(
              label: "POST",
              onPressed: () async {
                // await NetworkUtils.instance
                //     .networkRequest(Method.post, "/venue_info", params: {
                //   "id": ["01cebe8d-beca-4b5a-b5ff-943d3f876328"]
                // }, onSuccess: (data) {
                //   print(data);
                // }, onError: (int code, String msg) {
                //   print(code);
                //   print(msg);
                // });
              }),
          SizedBox(
            height: 20,
          ),
          Button(
              label: "DOWNLOAD",
              onPressed: () async {
                // await NetworkUtils.instance.download("", "", onSuccess: (data) {
                //   print(data);
                // }, onError: (int code, String msg) {
                //   print(code);
                //   print(msg);
                // });
              }),
          SizedBox(
            height: 20,
          ),
          Button(
              label: "FORM DATA",
              onPressed: () async {
                // await NetworkUtils.instance.postFormData("",
                //     formData: FormData.fromMap({"id": "", " ": ""}),
                //     onSuccess: (data) {
                //   print(data);
                // }, onError: (int code, String msg) {
                //   print(code);
                //   print(msg);
                // });
              }),
        ],
      ),
    );
  }
}
