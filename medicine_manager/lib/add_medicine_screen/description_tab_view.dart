import 'package:flutter/material.dart';

import '../utils/my_text_form_field.dart';

class DescriptionTabView extends StatelessWidget {
  const DescriptionTabView(
      {Key? key,
      required this.name,
      required this.description,
      required this.onChangeName,
      required this.onChangeDescription})
      : super(key: key);

  final String name;
  final String description;
  final Function(String?) onChangeName;
  final Function(String?) onChangeDescription;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
                child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                MyTextFormField(
                  input: name,
                  label: 'Nome do remédio',
                  onChange: onChangeName,
                ),
                const SizedBox(height: 16),
                MyTextFormField(
                  input: description,
                  label: 'Descrição do remédio',
                  onChange: onChangeDescription,
                )
              ],
            ))));
  }
}
