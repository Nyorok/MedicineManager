import 'package:flutter/material.dart';
import 'package:medicine_manager/navigation_menu/navigation_menu.dart';
import 'package:medicine_manager/providers/medicines_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => MedicinesProvider(),
          )
        ],
        child: MaterialApp(
          title: 'Administrador de Remédios',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const NavigationMenu(),
        ));
  }
}
