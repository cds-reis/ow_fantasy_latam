import 'package:flutter/material.dart';

import '../../../../entities/player/player.dart';
import '../../../../utils/build_context_extensions.dart';

class SelectedPlayerItemInfo extends StatelessWidget {
  const SelectedPlayerItemInfo({required this.player, super.key});

  final Player? player;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          switch (player) {
            null => 'Select a player',
            Player(:final name, :final teamName) =>
              '$name${!context.isMobile ? ' ($teamName)' : ''}',
          },
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Cost: ${player?.cost ?? 0}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(color: Colors.white, thickness: 1),
        Text(
          'Latest Score: ${player?.latestScore.formatted ?? 0}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Total Score: ${player?.totalScore.formatted ?? 0}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
