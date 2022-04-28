import 'package:flutter/material.dart';

import '../utils/my_text_form_field.dart';

class DescriptionTabView extends StatefulWidget {
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
  State<DescriptionTabView> createState() => _DescriptionTabViewState();
}

class _DescriptionTabViewState extends State<DescriptionTabView> {
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
                  input: widget.name,
                  label: 'Nome do remédio',
                  onChange: widget.onChangeName,
                ),
                const SizedBox(height: 16),
                MyTextFormField(
                  input: widget.description,
                  label: 'Descrição do remédio',
                  onChange: widget.onChangeDescription,
                )
              ],
            ))));
  }
}
