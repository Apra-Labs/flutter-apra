import 'package:flutter/material.dart';
import 'package:flutter_apra/widgets/dots_loader.dart';

class LoadingProgressBar extends StatelessWidget {
  LoadingProgressBar(this.message);

  final String message;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage("assets/apra_logo_small.png"),
            ),
            if (message != null) Text(message),
            SizedBox(height: 50, child: LoadingDots())
          ],
        ),
      ),
    );
  }
}
