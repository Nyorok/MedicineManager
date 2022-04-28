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
      name: "Losartana",
      description: "Remédio para pressão alta",
      quantity: '12',
      expirationDate: "2022-09-11",
      scheduleHour: "08:30",
      values: [true, true, true, true, true, true, true],
      scheduledQuantity: '1'),
  Medicine(
      name: "Torsilax",
      description: "Anti-inflamatório",
      quantity: '20',
      expirationDate: "2022-06-02",
      scheduleHour: "09:00",
      values: [true, false, false, false, false, false, false],
      scheduledQuantity: '1'),
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
