import 'package:flutter/material.dart';
import 'package:medicine_manager/providers/medicines_provider.dart';
import 'package:provider/provider.dart';

import 'medicine_card.dart';

class QuantityMedicinesTab extends StatefulWidget {
  const QuantityMedicinesTab({Key? key}) : super(key: key);

  @override
  State<QuantityMedicinesTab> createState() => _QuantityMedicinesTabState();
}

class _QuantityMedicinesTabState extends State<QuantityMedicinesTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MedicinesProvider>(
      builder: (context, medicineProvider, _) => Scaffold(
          body: ListView(
        children: medicineProvider.medicines
            .map((e) => MedicineCard(
                  medicine: e,
                  isSchedule: false,
                ))
            .toList(),
      )),
    );
  }
}
