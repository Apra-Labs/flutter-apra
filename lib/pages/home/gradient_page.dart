import 'package:flutter/material.dart';
import 'package:flutter_apra/containers/application_page.dart';
import 'package:flutter_apra/theme.dart';
import 'package:flutter_apra/widgets/buttons.dart';
import 'package:flutter_apra/widgets/gradients.dart';
import 'package:flutter_apra/widgets/textinput.dart';

class GradientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
      gradient: Gradients.gradient1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "USERNAME",
            style: TextStyle(color: AppColors.light, fontSize: FontSize.medium),
          ),
          SizedBox(
            height: 10,
          ),
          TextInput(onChange: (str) {}),
          SizedBox(
            height: 20,
          ),
          Text(
            "LOCATION",
            style: TextStyle(color: AppColors.light, fontSize: FontSize.medium),
          ),
          SizedBox(
            height: 10,
          ),
          TextInput(onChange: (str) {}),
          SizedBox(
            height: 20,
          ),
          Button(
            label: "PROCEED",
            onPressed: () {},
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            trailingIcon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
