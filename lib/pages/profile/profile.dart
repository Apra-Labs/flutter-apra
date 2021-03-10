import 'package:flutter/material.dart';
import 'package:flutter_apra/controllers/utils.dart';
import 'package:flutter_apra/theme.dart';
import 'package:flutter_apra/widgets/buttons.dart';
import 'package:flutter_apra/widgets/date_picker.dart';
import 'package:flutter_apra/widgets/drop_down.dart';
import 'package:flutter_apra/widgets/radio.dart';
import 'package:flutter_apra/widgets/textinput.dart';
import 'package:flutter_apra/widgets/time_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String groupValue;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextInput(
            borderStyle: BorderStyle.solid,
            onChange: (value) {},
            filled: false,
            labelText: "Name",
          ),
          SizedBox(
            height: 20,
          ),
          DatePicker(
            labelText: "Date of Birth",
            borderStyle: BorderStyle.solid,
            initiallySelected: false,
            filled: false,
            lastDate: DateTime(DateTime.now().year + 50),
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            onDateChanged: (DateTime value) {
              print(value);
            },
          ),
          SizedBox(
            height: 20,
          ),
          TimePicker(
            initialDate: DateTime.now(),
            onTimeChanged: (DateTime value) {},
            labelText: "Opening Time",
            suffixIcon: Icon(Icons.access_time),
          ),
          SizedBox(
            height: 20,
          ),
          DropDown(
            items: ["Male", "Female", "Transgender"],
            fillColor: AppColors.gray,
            onChanged: (str) {},
            labelText: "Select Gender",
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              RadioButton(
                  value: "Male",
                  groupValue: groupValue,
                  textControlAffinity: TextControlAffinity.leading,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value;
                    });
                  }),
              RadioButton(
                  value: "Female",
                  groupValue: groupValue,
                  textControlAffinity: TextControlAffinity.leading,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value;
                    });
                  }),
              RadioButton(
                  value: "Transgender",
                  groupValue: groupValue,
                  textControlAffinity: TextControlAffinity.leading,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value;
                    });
                  }),
            ],
          ),
          Button(
            onPressed: () async {
              Utils.showProgressBar(context, "");
              await Future.delayed(Duration(seconds: 5));
              Navigator.of(context).pop();
            },
            label: "Save",
            borderRadius: 5,
          ),
        ],
      ),
    );
  }
}
