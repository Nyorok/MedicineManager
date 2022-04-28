import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medicine_manager/list_medicines_screen/quantity_medicines_tab.dart';
import 'package:medicine_manager/list_medicines_screen/scheduled_medicines_tab.dart';
import 'package:medicine_manager/providers/medicines_provider.dart';
import 'package:provider/provider.dart';

class MedicinesScreen extends StatefulWidget {
  const MedicinesScreen({Key? key}) : super(key: key);

  @override
  State<MedicinesScreen> createState() => _MedicinesScreenState();
}

class _MedicinesScreenState extends State<MedicinesScreen>
    with SingleTickerProviderStateMixin {
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TabController _tabController;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    timer = Timer.periodic(
        const Duration(seconds: 15),
        (Timer t) =>
            _tabController.animateTo(_tabController.index == 0 ? 1 : 0));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MedicinesProvider>(
      builder: (context, medicineProvider, _) => Scaffold(
        appBar: AppBar(
            title: const Text("Remédios"),
            centerTitle: true,
            bottom: TabBar(controller: _tabController, tabs: const [
              Tab(text: "1. Agendamentos"),
              Tab(text: "2. Quantidades"),
            ])),
        body: TabBarView(
          controller: _tabController,
          children: [ScheduledMedicinesTab(), QuantityMedicinesTab()],
        ),
      ),
    );
  }
}
