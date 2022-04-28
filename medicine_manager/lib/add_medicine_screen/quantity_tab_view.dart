import 'package:flutter/material.dart';
import 'package:medicine_manager/utils/my_text_form_field_date.dart';

import '../utils/my_text_form_field.dart';

class QuantityTabView extends StatefulWidget {
  const QuantityTabView(
      {Key? key,
      required this.quantity,
      required this.onChangeQuantity,
      required this.expirationDate,
      required this.onChangeExpirationDate})
      : super(key: key);

  final String quantity;
  final Function(String?) onChangeQuantity;
  final String expirationDate;
  final Function(String?) onChangeExpirationDate;

  @override
  State<QuantityTabView> createState() => _QuantityTabViewState();
}

class _QuantityTabViewState extends State<QuantityTabView> {
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
                  input: widget.quantity,
                  label: 'Quantidade (un.)',
                  onChange: widget.onChangeQuantity,
                ),
                const SizedBox(height: 16),
                MyDateFormField(
                  input: widget.expirationDate,
                  label: 'Validade do remédio',
                  onSaved: widget.onChangeExpirationDate,
                ),
              ],
            ))));
  }
}
