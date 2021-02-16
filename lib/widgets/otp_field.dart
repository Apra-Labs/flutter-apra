import 'package:flutter/material.dart';

class OTPField extends StatefulWidget {
  final int length;

  final double width;

  final double fieldWidth;

  final TextInputType keyboardType;

  final TextStyle style;

  final MainAxisAlignment textFieldAlignment;

  final bool obscureText;

  final ValueChanged<String> onChanged;

  final ValueChanged<String> onCompleted;

  final double borderRadius;
  final bool filled;
  final Color fillColor;
  final BorderStyle borderStyle;

  OTPField(
      {Key key,
      this.length = 4,
      @required this.width = 10,
      this.fieldWidth = 30,
      this.keyboardType = TextInputType.number,
      this.style = const TextStyle(),
      this.textFieldAlignment = MainAxisAlignment.spaceBetween,
      this.obscureText = false,
      this.onChanged,
      this.onCompleted,
      this.borderRadius = 20,
      this.filled = false,
      this.fillColor = Colors.white,
      this.borderStyle = BorderStyle.none})
      : assert(length > 1);

  @override
  _OTPFieldState createState() => _OTPFieldState();
}

class _OTPFieldState extends State<OTPField> {
  List<FocusNode> _focusNodes;
  List<TextEditingController> _textControllers;

  List<Widget> _textFields;
  List<String> _pin;

  @override
  void initState() {
    super.initState();
    _focusNodes = List<FocusNode>(widget.length);
    _textControllers = List<TextEditingController>(widget.length);

    _pin = List.generate(widget.length, (int i) {
      return '';
    });
    _textFields = List.generate(widget.length, (int i) {
      return buildTextField(context, i);
    });
  }

  @override
  void dispose() {
    _textControllers
        .forEach((TextEditingController controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Row(
        mainAxisAlignment: widget.textFieldAlignment,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _textFields,
      ),
    );
  }

  Widget buildTextField(BuildContext context, int i) {
    if (_focusNodes[i] == null) _focusNodes[i] = new FocusNode();

    if (_textControllers[i] == null)
      _textControllers[i] = new TextEditingController();

    return Container(
      width: widget.fieldWidth,
      child: TextField(
        controller: _textControllers[i],
        keyboardType: widget.keyboardType,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: widget.style,
        focusNode: _focusNodes[i],
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(width: 0.0, style: widget.borderStyle),
          ),
          filled: widget.filled,
          fillColor: widget.fillColor,
        ),
        onChanged: (String str) {
          if (str.isEmpty) {
            if (i == 0) widget.onCompleted('');
            _focusNodes[i].unfocus();
            _focusNodes[i - 1].requestFocus();
          }
          setState(() {
            _pin[i] = str;
          });
          if (str.isNotEmpty) _focusNodes[i].unfocus();
          if (i + 1 != widget.length && str.isNotEmpty)
            FocusScope.of(context).requestFocus(_focusNodes[i + 1]);

          String currentPin = "";
          _pin.forEach((String value) {
            currentPin += value;
          });
          if (!_pin.contains(null) &&
              !_pin.contains('') &&
              currentPin.length == widget.length) {
            widget.onCompleted(currentPin);
          }
          widget.onChanged(currentPin);
        },
      ),
    );
  }
}
