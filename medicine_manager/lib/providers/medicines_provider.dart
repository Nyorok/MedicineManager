import 'package:flutter/material.dart';
import 'package:medicine_manager/entities/medicine.dart';

List<Medicine> initialMedicines = [
  Medicine(
      name: "Paracetamol",
      description: "Remédio para febre",
      quantity: '15',
      expirationDate: "2022-09-11",
      scheduleHour: "14:30",
      values: [true, false, false, true, false, false, false],
      scheduledQuantity: '1'),
  Medicine(
      name: "Dorflex",
      description: "Dores musculares",
      quantity: '8',
      expirationDate: "2022-04-22",
      scheduleHour: "10:30",
      values: [true, true, false, false, false, false, false],
      scheduledQuantity: '1'),
  Medicine(
      name: "Rivotril",
      description: "Relaxamento",
      quantity: '34',
      expirationDate: "2022-06-25",
      scheduleHour: "08:30",
      values: [true, false, false, true, false, false, false],
      scheduledQuantity: '2'),
  Medicine(
      name: "Neosaldina",
      description: "Dor de cabeça",
      quantity: '31',
      expirationDate: "2022-08-12",
      scheduleHour: "12:15",
      values: [true, true, false, false, false, false, false],
      scheduledQuantity: '1'),
  Medicine(
      name: "Paracetamol 2",
      description: "Remédio para febre",
      quantity: '5',
      expirationDate: "2022-09-11",
      scheduleHour: "08:30",
      values: [false, false, false, true, false, true, false],
      scheduledQuantity: '3'),
  Medicine(
      name: "Dorflex 2",
      description: "Dores musculares",
      quantity: '16',
      expirationDate: "2022-04-22",
      scheduleHour: "17:30",
      values: [false, false, true, true, false, false, false],
      scheduledQuantity: '1'),
  Medicine(
      name: "Rivotril 2",
      description: "Relaxamento",
      quantity: '15',
      expirationDate: "2022-06-25",
      scheduleHour: "08:00",
      values: [true, true, false, false, false, false, false],
      scheduledQuantity: '1'),
  Medicine(
      name: "Neosaldina 2",
      description: "Dor de cabeça",
      quantity: '13',
      expirationDate: "2022-08-12",
      scheduleHour: "07:30",
      values: [true, false, false, true, false, false, false],
      scheduledQuantity: '2'),
];

class MedicinesProvider extends ChangeNotifier {
  List<Medicine> _medicines = initialMedicines;

  List<Medicine> get medicines => _medicines;
  set medicines(List<Medicine> medicines) {
    _medicines = medicines;
    notifyListeners();
  }

  addMedicine(Medicine medicine) {
    _medicines.add(medicine);
    notifyListeners();
  }
}
