import 'package:flutter/material.dart';
import 'package:flutter_apra/constants.dart';
import 'package:flutter_apra/theme.dart';

// ignore: must_be_immutable
class Alert extends StatelessWidget {
  final String title;
  final TextStyle titleTextStyle;
  final AlignmentGeometry titleAlignment;
  final String message;
  final Widget body;
  final Function onAccept;
  final String acceptLabel;
  final String denyLabel;
  Function onDeny;

  Alert(
      {@required this.title,
      @required this.onAccept,
      this.titleTextStyle,
      this.titleAlignment = Alignment.center,
      this.message,
      this.body,
      this.acceptLabel = Texts.AcceptLabel,
      this.denyLabel = Texts.CloseLabel,
      this.onDeny}) {
    onDeny ??= () {};
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Align(alignment: titleAlignment, child: Text(title)),
      titleTextStyle: this.titleTextStyle,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: EdgeInsets.all(20.0),
      content: SingleChildScrollView(
        child: Column(
          children: [
            if (message != null) Text(message),
            body ?? Container(),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              onDeny();
              Navigator.of(context).pop();
            },
            child: Text(denyLabel,style: TextStyle(color: AppColors.danger),)),
        TextButton(
            onPressed: () {
              onAccept();
              Navigator.of(context).pop();
            },
            child: Text(acceptLabel))
      ],
    );
  }
}
