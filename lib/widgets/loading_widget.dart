import 'package:flutter/material.dart';
import 'package:flutter_apra/widgets/dots_loader.dart';

class LoadingProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage("assets/apra_logo_small.png"),
            ),
            SizedBox(
              height: 50,
                child: LoadingDots())
          ],
        ),
      ),
    );
  }
}
