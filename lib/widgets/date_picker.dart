import 'package:flutter/material.dart';
import 'package:flutter_apra/theme.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final ValueChanged<DateTime> onDateChanged;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateFormat dateFormat;
  final FocusNode focusNode;
  final String labelText;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final String placeholder;
  final String errorText;
  final TextAlign textAlign;
  final double borderRadius;
  final BorderStyle borderStyle;
  final bool filled;
  final Color fillColor;
  final bool initiallySelected;
  final bool initiallySelectedFirst;

  DatePicker(
      {Key key,
      this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.focusNode,
      this.dateFormat,
      this.placeholder,
      @required this.lastDate,
      @required this.firstDate,
      @required this.initialDate,
      @required this.onDateChanged,
      this.textAlign = TextAlign.left,
      this.borderRadius = 4.0,
      this.errorText,
      this.borderStyle = BorderStyle.none,
      this.filled = false,
      this.initiallySelected = true,
      this.initiallySelectedFirst = false,
      this.fillColor = AppColors.gray});

  @override
  _DatePicker createState() => _DatePicker(this.initialDate);
}

class _DatePicker extends State<DatePicker> {
  TextEditingController _controllerDate;
  DateFormat _dateFormat;
  DateTime initialDate;
  bool initiallySelected;

  _DatePicker(this.initialDate);

  @override
  void initState() {
    super.initState();

    if (widget.dateFormat != null) {
      _dateFormat = widget.dateFormat;
    } else {
      _dateFormat = DateFormat('d/M/y');
    }
    initiallySelected = widget.initiallySelected;

    _controllerDate = TextEditingController();

    initiallySelected
        ? _controllerDate.text = _dateFormat.format(initialDate)
        : _controllerDate.text = '';
  }

  @override
  void didUpdateWidget(covariant DatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    initialDate = widget.initialDate;
    initiallySelected
        ? _controllerDate.text = _dateFormat.format(initialDate)
        : _controllerDate.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focusNode,
      controller: _controllerDate,
      textAlign: widget.textAlign,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20.0),
        border: OutlineInputBorder(
          gapPadding: 3.0,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(width: 0, style: widget.borderStyle),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        errorText: widget.errorText,
        suffixIconConstraints: BoxConstraints(minWidth: 40, minHeight: 32),
        labelText: widget.labelText,
        hintText: widget.placeholder,
        filled: widget.filled,
        fillColor: widget.fillColor,
      ),
      onTap: () => _selectDate(context),
      readOnly: true,
    );
  }

  @override
  void dispose() {
    _controllerDate.dispose();
    super.dispose();
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
    );

    if (pickedDate != null && pickedDate != initialDate) {
      setState(() {
        initiallySelected = true;
      });
      initialDate = DateTime(pickedDate.year, pickedDate.month, pickedDate.day,
          initialDate.hour, initialDate.minute);
      _controllerDate.text = _dateFormat.format(initialDate);
      widget.onDateChanged(initialDate);
    }

    if (widget.focusNode != null) {
      widget.focusNode.nextFocus();
    }
  }
}
