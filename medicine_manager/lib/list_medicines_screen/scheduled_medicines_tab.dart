import 'package:flutter/material.dart';
import 'package:medicine_manager/providers/medicines_provider.dart';
import 'package:provider/provider.dart';

import 'medicine_card.dart';

class ScheduledMedicinesTab extends StatefulWidget {
  const ScheduledMedicinesTab({Key? key}) : super(key: key);

  @override
  State<ScheduledMedicinesTab> createState() => _ScheduledMedicinesTabState();
}

class _ScheduledMedicinesTabState extends State<ScheduledMedicinesTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MedicinesProvider>(
      builder: (context, medicineProvider, _) => Scaffold(
          body: ListView(
        children: medicineProvider.medicines
            .map((e) => MedicineCard(
                  medicine: e,
                  isSchedule: true,
                ))
            .toList(),
      )),
    );
  }
}
