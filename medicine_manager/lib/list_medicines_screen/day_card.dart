import 'package:flutter/material.dart';

class DayCard extends StatelessWidget {
  final String day;
  final bool selected;

  const DayCard({
    required this.day,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: selected ? Colors.blue : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          day,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
