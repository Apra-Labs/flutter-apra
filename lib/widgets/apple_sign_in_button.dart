import 'package:flutter/material.dart';

class AppleSignInButton extends StatelessWidget {
  final Function onPressed;

  AppleSignInButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 3,
      color: Colors.black,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Image(
          image: AssetImage("assets/appleid_button.png"),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 34.0),
    );
  }
}
