import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class MyDateFormField extends StatelessWidget {
  final String input;
  final String label;
  final Function(String?) onSaved;

  const MyDateFormField({
    required this.input,
    required this.label,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      initialValue: input,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      dateLabelText: label,
      validator: (val) {
        return null;
      },
      onChanged: onSaved,
      onSaved: onSaved,
    );
  }
}
