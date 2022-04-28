import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:medicine_manager/utils/my_week_day_selector.dart';

import '../utils/my_text_form_field.dart';
import '../utils/my_text_form_field_date.dart';

class ScheduleTabView extends StatelessWidget {
  ScheduleTabView({
    Key? key,
    required this.values,
    required this.onChangeValues,
    required this.scheduleDate,
    required this.onChangeScheduleDate,
    required this.scheduledQuantity,
    required this.onChangeScheduledQuantity,
  }) : super(key: key);

  final List<bool> values;
  final Function(int) onChangeValues;
  final String scheduleDate;
  final Function(String?) onChangeScheduleDate;
  final String scheduledQuantity;
  final Function(String?) onChangeScheduledQuantity;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
                child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              children: [
                MyWeekDaySelector(values: values, onSaved: onChangeValues),
                const SizedBox(height: 16),
                DateTimePicker(
                  type: DateTimePickerType.time,
                  timeHintText: 'Horário',
                  onChanged: onChangeScheduleDate,
                ),
                const SizedBox(height: 16),
                MyTextFormField(
                  input: scheduledQuantity,
                  label: 'Quantidade (un.)',
                  onChange: onChangeScheduledQuantity,
                ),
              ],
            ))));
  }
}
