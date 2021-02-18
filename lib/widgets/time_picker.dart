import 'package:flutter/material.dart';
import 'package:flutter_apra/theme.dart';
import 'package:intl/intl.dart';

class TimePicker extends StatefulWidget {
  final ValueChanged<DateTime> onTimeChanged;
  final DateTime initialDate;
  final FocusNode focusNode;
  final String labelText;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final TimeOfDayFormat format;

  TimePicker(
      {Key key,
      this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.focusNode,
      @required this.onTimeChanged,
      @required this.initialDate,
      this.format})
      : assert(initialDate != null),
        super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState(this.initialDate);
}

class _TimePickerState extends State<TimePicker> {
  TextEditingController _controllerTime;
  TimeOfDayFormat format;
  DateTime _initialDate;
  TimeOfDay initialTime;

  _TimePickerState(this._initialDate);

  @override
  void initState() {
    super.initState();
    format = TimeOfDayFormat.h_colon_mm_space_a;
    initialTime =
        TimeOfDay(hour: _initialDate.hour, minute: _initialDate.minute);
    _controllerTime = TextEditingController();
    _controllerTime.text = DateFormat.jm().format(_initialDate);
  }

  @override
  void didUpdateWidget(TimePicker o) {
    super.didUpdateWidget(o);
    _initialDate = widget.initialDate;
    _controllerTime.text = DateFormat.jm().format(widget.initialDate);
    initialTime = TimeOfDay(
        hour: widget.initialDate.hour, minute: widget.initialDate.minute);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focusNode,
      controller: _controllerTime,
      style: TextStyle(fontSize: FontSize.medium),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20.0),
        border: OutlineInputBorder(),
        suffixIconConstraints: BoxConstraints(minWidth: 40, minHeight: 32),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        labelText: widget.labelText,
      ),
      onTap: () => _selectTime(context),
      readOnly: true,
    );
  }

  @override
  void dispose() {
    _controllerTime.dispose();
    super.dispose();
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (pickedTime != null && pickedTime != initialTime) {
      setState(() {
        initialTime = pickedTime;
        _initialDate = DateTime(_initialDate.year, _initialDate.month,
            _initialDate.day, pickedTime.hour, pickedTime.minute);
        _initialDate = _initialDate;
      });
      _controllerTime.text = DateFormat.jm().format(_initialDate);
      widget.onTimeChanged(_initialDate);
    }

    if (widget.focusNode != null) {
      widget.focusNode.nextFocus();
    }
  }
}
