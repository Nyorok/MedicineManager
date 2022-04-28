import 'package:flutter/material.dart';
import 'package:medicine_manager/add_medicine_screen/add_medicine_screen.dart';
import 'package:medicine_manager/intro_screen/intro_screen.dart';
import 'package:medicine_manager/list_medicines_screen/medicines_screen.dart';
import 'package:medicine_manager/list_medicines_screen/scheduled_medicines_tab.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      IntroScreen(
        onDone: () => setState(() => _currentIndex = 1),
      ),
      AddMedicineScreen(
        onAdd: () => setState(() => _currentIndex = 2),
      ),
      const MedicinesScreen()
    ];
    return Scaffold(
      body: Center(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.aod_rounded),
            icon: Icon(Icons.aod_outlined),
            label: 'Primeiros passos',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.add_circle_outlined),
            icon: Icon(Icons.add_circle_outline_sharp),
            label: 'Adicionar',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.medication_liquid_outlined),
            icon: Icon(Icons.medication_liquid_sharp),
            label: 'Remédios',
          ),
        ],
      ),
    );
  }
}
