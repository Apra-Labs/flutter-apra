import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_apra/controllers/utils.dart';
import 'package:flutter_apra/theme.dart';
import 'package:flutter_apra/widgets/buttons.dart';
import 'package:flutter_apra/widgets/date_picker.dart';
import 'package:flutter_apra/widgets/drop_down.dart';
import 'package:flutter_apra/widgets/radio.dart';
import 'package:flutter_apra/widgets/textinput.dart';
import 'package:flutter_apra/widgets/time_picker.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String groupValue;
  File _image;
  final picker = ImagePicker();

  void _pickImage({ImageSource imageSource}) async {
    PickedFile pickedImage =
        await picker.getImage(source: imageSource, imageQuality: 50);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Gallery'),
                      onTap: () {
                        _pickImage(imageSource: ImageSource.gallery);
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _pickImage(imageSource: ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: CircleAvatar(
                radius: 55,
                backgroundColor: AppColors.primary,
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          _image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
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
            suffixIcon: Icon(Icons.date_range),
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
          SizedBox(
            height: 20,
          ),
          Button(
            onPressed: () async {
              Utils.showProgressBar(context, message: null);
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
