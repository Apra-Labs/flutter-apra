import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apra/constants.dart';
import 'package:flutter_apra/containers/application_page.dart';
import 'package:flutter_apra/controllers/utils.dart';
import 'package:flutter_apra/theme.dart';
import 'package:flutter_apra/widgets/alert.dart';
import 'package:flutter_apra/widgets/apple_sign_in_button.dart';
import 'package:flutter_apra/widgets/buttons.dart';
import 'package:flutter_apra/widgets/facebook_sign_in_button.dart';
import 'package:flutter_apra/widgets/google_sign_in_button.dart';
import 'package:flutter_apra/widgets/otp_field.dart';
import 'package:flutter_apra/widgets/textinput.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthPage extends StatelessWidget {
  Future _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      title: PageTitles.Authentication,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GoogleSignInButton(
              onPressed: () async {
                // GoogleSignInService googleSignInService = GoogleSignInService();
                // User user = await googleSignInService.signInWithGoogle();
                // print(user);
              },
            ),
            SizedBox(
              height: 10,
            ),
            AppleSignInButton(
              onPressed: () async {
                // AppleAuthService appleAuthService = AppleAuthService();
                // if (await appleAuthService.appleSignInAvailable) {
                //   User user = await appleAuthService.appleSignIn();
                //   print(user);
                //   return;
                // }
                // print("Apple Sign Not Available");
              },
            ),
            SizedBox(
              height: 10,
            ),
            FacebookSignInButton(
              onPressed: () async {
                // FacebookSignInService facebookSignInService =
                //     FacebookSignInService();
                // dynamic user = await facebookSignInService.signInWithFacebook();

                //Remove this showDialog when setup is done
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return Alert(
                        onAccept: () {
                          RouteUtils.goBack(context);
                        },
                        title:
                            "Setup Facebook for Android & iOS using below url",
                        body: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: FontSize.medium,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(text: "• Android "),
                                    TextSpan(
                                        text:
                                            "https://pub.dev/packages/flutter_facebook_auth#android",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            await _launchURL(
                                                "https://pub.dev/packages/flutter_facebook_auth#android");
                                          },
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: FontSize.medium,
                                            color: AppColors.primary)),
                                    TextSpan(text: "\n\n• iOS "),
                                    TextSpan(
                                        text:
                                            "https://pub.dev/packages/flutter_facebook_auth#ios",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            await _launchURL(
                                                "https://pub.dev/packages/flutter_facebook_auth#ios");
                                          },
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: FontSize.medium,
                                            color: AppColors.primary)),
                                  ]),
                            ),
                          ],
                        ),
                        denyLabel: "Cancel",
                      );
                    });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text("---------------- or ----------------"),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.gray2,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: CountryCodePicker(
                    initialSelection: 'IN',
                    padding: EdgeInsets.symmetric(vertical: 20),
                    showCountryOnly: false,
                    favorite: ['US', 'IN'],
                    onInit: (value) {},
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextInput(
                    value: "",
                    onChange: (value) {},
                    onSubmit: (value) {},
                    placeholder: "Phone Number",
                    fillColor: AppColors.gray2,
                    type: TextInputType.number,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              label: "Send OTP",
              onPressed: () async {
                // PhoneAuthService phoneAuthService = PhoneAuthService();
                // await phoneAuthService.verifyPhone("phone", onError: (String error) {});
              },
              borderRadius: 15,
              padding: EdgeInsets.all(8),
            ),
            SizedBox(
              height: 10,
            ),
            OTPField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceEvenly,
              fillColor: AppColors.actionbar,
              fieldWidth: 50,
              borderRadius: 15,
              onCompleted: (code) {},
              onChanged: (code) {},
              filled: true,
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              label: "Verify OTP",
              onPressed: () async {
                // PhoneAuthService phoneAuthService = PhoneAuthService();
                // User user = await phoneAuthService.verifyOTP("code");
              },
              borderRadius: 15,
              padding: EdgeInsets.all(8),
            ),
          ],
        ),
      ),
    );
  }
}
