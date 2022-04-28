import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';

class MyWeekDaySelector extends StatelessWidget {
  final List<bool> values;
  final Function(int day) onSaved;

  const MyWeekDaySelector({
    required this.values,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return WeekdaySelector(
      onChanged: onSaved,
      values: values,
      shortWeekdays: [
        "Sab",
        "Dom",
        "Seg",
        "Ter",
        "Qua",
        "Qui",
        "Sex",
      ],
    );
  }
}
