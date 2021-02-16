import 'package:flutter/material.dart';
import 'package:flutter_apra/constants.dart';
import 'package:flutter_apra/containers/application_page.dart';
import 'package:flutter_apra/controllers/utils.dart';
import 'package:flutter_apra/theme.dart';
import 'package:flutter_apra/widgets/buttons.dart';
import 'package:flutter_apra/widgets/otp_field.dart';
import 'package:flutter_apra/widgets/readmore.dart';
import 'package:flutter_apra/widgets/textinput.dart';


class EditTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationPage(
        title: PageTitles.EditTextField,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            tooltip: "More",
            itemBuilder: (_) => <PopupMenuItem>[
              new PopupMenuItem(
                  child: Text('Change Language'),
                  value: 'Change Language'),
              new PopupMenuItem(
                  child: Text('Dark Mode'), value: 'Dark Mode'),
            ],
            onSelected: (i) {
              print(i);
            },
          ),
        ],
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextInput(
                onChange: null,
                placeholder: "Email",
              ),
              SizedBox(
                height: 20,
              ),
              TextInput(
                onChange: null,
                rows: 3,
                placeholder: "Something",
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                  label: "Save",
                  onPressed: () {
                    RouteUtils.goBack(context);
                  }),
              SizedBox(
                height: 20,
              ),
              ReadMoreText(
                "Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.",
                trimMode: TrimMode.Line,
                colorClickableText: AppColors.primary,
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 2,
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text(
                      "Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    childrenPadding:
                        EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Location"),
                          IconButton(
                            icon: Icon(Icons.location_on),
                            onPressed: () {},
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Button(label: "Done", onPressed: () {}),
                          Button(label: "Save", onPressed: () {}),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
