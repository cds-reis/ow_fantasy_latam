import 'package:flutter/material.dart';

class GameWeekItem extends StatelessWidget {
  const GameWeekItem({
    required this.label,
    required this.value,
    super.key,
  }) : highlighted = false;

  const GameWeekItem.highlighted({
    required this.label,
    required this.value,
    super.key,
  }) : highlighted = true;

  final String label;
  final String value;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: highlighted ? Colors.green.shade700 : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: highlighted ? Colors.black : Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
