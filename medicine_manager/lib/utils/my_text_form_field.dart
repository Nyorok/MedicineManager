import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String input;
  final String label;
  final Function(String?) onChange;

  const MyTextFormField({
    required this.input,
    required this.label,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if ((value?.length ?? 0) < 6) {
          return 'Adicione pelo menos 6 caracteres';
        } else {
          return null;
        }
      },
      initialValue: input,
      maxLength: 30,
      onChanged: onChange,
      onSaved: onChange,
    );
  }
}
