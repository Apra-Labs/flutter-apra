import 'package:flutter/material.dart';

import '../theme.dart';

enum FacebookButtonColor { BLUE, WHITE }

class FacebookSignInButton extends StatelessWidget {
  final Function onPressed;
  final FacebookButtonColor buttonColor;

  FacebookSignInButton(
      {@required this.onPressed, this.buttonColor = FacebookButtonColor.BLUE});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      elevation: 3,
      color: buttonColor == FacebookButtonColor.WHITE
          ? Colors.white
          : Color.fromRGBO(24, 119, 242, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage("assets/fb_logo.png"),
            height: 18.0,
            width: 18.0,
          ),
          SizedBox(width: 24),
          Text(
            'Login with Facebook',
            style: TextStyle(
                fontSize: FontSize.normal,
                color: buttonColor == FacebookButtonColor.WHITE
                    ? AppColors.textNormal
                    : Colors.white),
          ),
        ],
      ),
    );
  }
}
