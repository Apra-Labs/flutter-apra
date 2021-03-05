import 'package:flutter/material.dart';

import '../theme.dart';

class GoogleSignInButton extends StatelessWidget {
  final Function onPressed;

  GoogleSignInButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage("assets/google_logo.png"),
            height: 18.0,
            width: 18.0,
          ),
          SizedBox(width: 24),
          Text(
            'Sign in with Google',
            style: TextStyle(
                fontSize: FontSize.normal, color: AppColors.textNormal),
          ),
        ],
      ),
    );
  }
}
