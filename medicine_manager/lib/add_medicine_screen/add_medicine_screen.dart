import 'package:flutter/material.dart';
import 'package:medicine_manager/add_medicine_screen/quantity_tab_view.dart';
import 'package:medicine_manager/add_medicine_screen/schedule_tab_view.dart';
import 'package:medicine_manager/entities/medicine.dart';
import 'package:medicine_manager/providers/medicines_provider.dart';
import 'package:provider/provider.dart';

import 'description_tab_view.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({Key? key, required this.onAdd}) : super(key: key);

  final Function onAdd;
  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen>
    with SingleTickerProviderStateMixin {
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TabController _tabController;
  bool isLastTab() => _tabController.index == 2;

  String name = '';
  String description = '';
  String quantity = '';
  String expirationDate = '';
  String scheduleDate = '';
  String scheduledQuantity = '';
  String buttonText = 'Próximo';
  final values = List.filled(7, false);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() =>
        setState(() => buttonText = isLastTab() ? 'Adicionar' : 'Próximo'));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MedicinesProvider>(
      builder: (context, medicineProvider, _) => Scaffold(
        appBar: AppBar(
            title: const Text("Adicionar Remédio"),
            centerTitle: true,
            bottom: TabBar(controller: _tabController, tabs: const [
              Tab(text: "1. Descrição"),
              Tab(text: "2. Quantidade"),
              Tab(text: "3. Agendamento"),
            ])),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            DescriptionTabView(
              name: name,
              description: description,
              onChangeName: (newValue) => setState(() => name = newValue ?? ''),
              onChangeDescription: (newValue) =>
                  setState(() => description = newValue ?? ''),
            ),
            QuantityTabView(
              quantity: quantity,
              expirationDate: expirationDate,
              onChangeQuantity: (newValue) =>
                  setState(() => quantity = newValue ?? ''),
              onChangeExpirationDate: (newValue) =>
                  setState(() => expirationDate = newValue ?? ''),
            ),
            ScheduleTabView(
              values: values,
              onChangeValues: (int day) {
                setState(() {
                  final index = day % 7;
                  values[index] = !values[index];
                });
              },
              scheduleDate: scheduleDate,
              onChangeScheduleDate: (newValue) =>
                  setState(() => scheduleDate = newValue ?? ''),
              scheduledQuantity: scheduledQuantity,
              onChangeScheduledQuantity: (newValue) =>
                  setState(() => scheduledQuantity = newValue ?? ''),
            ),
          ],
        ),
        floatingActionButton: ElevatedButton(
          child: Text(buttonText),
          onPressed: () {
            if (isLastTab()) {
              if (name.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Nome precisa ser preenchido."),
                ));
              } else {
                medicineProvider.addMedicine(Medicine(
                    name: name,
                    description: description,
                    quantity: quantity,
                    expirationDate: expirationDate,
                    scheduleHour: scheduleDate,
                    values: values,
                    scheduledQuantity: scheduledQuantity));
                widget.onAdd();
              }
            } else {
              _tabController.animateTo(_tabController.index + 1);
            }
          },
        ),
      ),
    );
  }
}
