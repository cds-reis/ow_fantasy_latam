import 'package:flutter/material.dart';

import '../../../../entities/player/player.dart';

class PlayerCostAndTeam extends StatelessWidget {
  const PlayerCostAndTeam({required this.player, super.key});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 16,
        children: [
          Text(
            'Cost: ${player.cost},',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Team: ${player.teamName}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
