import 'package:flutter/material.dart';

enum TextControlAffinity { leading, trailing }

class RadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final TextControlAffinity textControlAffinity;
  final TextStyle textStyle;

  RadioButton(
      {@required this.value,
        @required this.groupValue,
        @required this.onChanged,
        this.textControlAffinity = TextControlAffinity.trailing,
        this.textStyle});

  @override
  Widget build(BuildContext context) {
    Widget leading;
    Widget trailing;

    Widget radioButtonWidget = Radio(
        value: value,
        toggleable: true,
        groupValue: groupValue,
        onChanged: (val) {
          onChanged(val);
        });

    Widget textWidget = Text(
      value.toString(),
      style: textStyle,
    );

    switch (textControlAffinity) {
      case TextControlAffinity.leading:
        leading = textWidget;
        trailing = radioButtonWidget;
        break;
      case TextControlAffinity.trailing:
        leading = radioButtonWidget;
        trailing = textWidget;
        break;
    }

    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Padding(
        padding: textControlAffinity == TextControlAffinity.leading
            ? const EdgeInsets.only(left: 8.0)
            : const EdgeInsets.only(right: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [leading, trailing],
        ),
      ),
    );
  }
}