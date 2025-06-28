import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/player_score_for_match.dart';
import '../../../providers/player_scores/player_provider.dart';

class PlayerScoreItem extends ConsumerWidget {
  const PlayerScoreItem({
    required this.playerScore,
    super.key,
  });
  final PlayerScoreForMatch playerScore;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(playerProvider(playerScore.playerId));

    return player.when(
      data: (player) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${player.name}:',
              style: const TextStyle(fontSize: 22),
            ),
            Text(
              playerScore.score.toString(),
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
