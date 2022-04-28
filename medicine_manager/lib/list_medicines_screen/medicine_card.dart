import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:medicine_manager/list_medicines_screen/day_card.dart';
import 'package:medicine_manager/utils/my_week_day_selector.dart';

import '../entities/medicine.dart';

class MedicineCard extends StatelessWidget {
  final Medicine medicine;
  final bool isSchedule;

  const MedicineCard({required this.medicine, required this.isSchedule});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      medicine.name,
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 4),
                    Text(medicine.description),
                  ],
                ),
                isSchedule
                    ? Column(
                        children: [
                          const SizedBox(height: 6),
                          Text("Horario: " + medicine.scheduleHour),
                          const SizedBox(height: 4),
                          Text("Quantidade: " + medicine.scheduledQuantity),
                        ],
                      )
                    : Column(
                        children: [
                          const SizedBox(height: 6),
                          Text("Validade: " + medicine.expirationDate),
                          const SizedBox(height: 4),
                          Text("Quantidade: " + medicine.quantity),
                        ],
                      ),
              ],
            ),
            Visibility(visible: isSchedule, child: const SizedBox(height: 16)),
            Visibility(
              visible: isSchedule,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DayCard(
                    day: "Dom",
                    selected: medicine.values[0],
                  ),
                  DayCard(
                    day: "Seg",
                    selected: medicine.values[1],
                  ),
                  DayCard(
                    day: "Ter",
                    selected: medicine.values[2],
                  ),
                  DayCard(
                    day: "Qua",
                    selected: medicine.values[3],
                  ),
                  DayCard(
                    day: "Qui",
                    selected: medicine.values[4],
                  ),
                  DayCard(
                    day: "Sex",
                    selected: medicine.values[5],
                  ),
                  DayCard(
                    day: "Sab",
                    selected: medicine.values[6],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
