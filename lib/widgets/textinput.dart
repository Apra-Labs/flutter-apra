import 'package:flutter/material.dart';
import 'package:flutter_apra/theme.dart';

class TextInput extends StatefulWidget {
  final String value;
  final Function onChange;
  final Function onSubmit;
  final bool autofocus;
  final String placeholder;
  final int rows;
  final TextInputType type;
  final double borderRadius;
  final Color fillColor;
  final bool inputTypePassword;
  final String errorText;
  final int maxLength;

  TextInput(
      {@required this.onChange,
      this.value,
      this.onSubmit,
      this.autofocus,
      this.placeholder,
      this.rows,
      this.borderRadius = 5.0,
      this.fillColor = AppColors.gray,
      this.inputTypePassword = false,
      this.errorText,
      this.maxLength,
      this.type});

  @override
  _TextInputState createState() => _TextInputState(
      onChange: onChange,
      autofocus: autofocus,
      onSubmit: onSubmit,
      value: value,
      placeholder: placeholder,
      rows: rows,
      type: type);
}

class _TextInputState extends State<TextInput> {
  String value;
  TextEditingController controller = TextEditingController();
  Function(String) onChange;
  Function(String) onSubmit;
  bool autofocus;
  String placeholder;
  int rows;
  TextInputType type;

  _TextInputState(
      {@required this.onChange,
      @required this.value,
      @required this.onSubmit,
      @required this.autofocus,
      @required this.placeholder,
      @required this.rows,
      @required this.type}) {
    value ??= "";
    onChange ??= (String x) {};
    onSubmit ??= (String x) {};
    autofocus ??= false;
    placeholder ??= "";
    type ??= TextInputType.text;

    if (type == TextInputType.multiline) {
      rows = rows ?? 3;
    } else {
      rows ??= 1;
    }

    controller.text = this.value;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: rows,
      maxLength: widget.maxLength,
      controller: controller,
      keyboardType: type,
      onChanged: onChange,
      onSubmitted: onSubmit,
      obscureText: widget.inputTypePassword,
      autofocus: autofocus,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20.0),
          errorText: widget.errorText,
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          hintText: placeholder,
          fillColor: widget.fillColor),
      cursorColor: AppColors.primary,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
