import 'package:flutter/material.dart';

import '../../../../entities/player/player.dart';

class BestPlayerItem extends StatelessWidget {
  const BestPlayerItem({required this.player, required this.index, super.key});

  final Player player;
  final int index;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Text('${index + 1}.'),
            ),
            Expanded(
              flex: 30,
              child: Text(player.name),
            ),
            Expanded(flex: 30, child: Text(player.teamName)),
            Expanded(
              flex: 15,
              child: Text(
                '${player.latestScore}pts.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
