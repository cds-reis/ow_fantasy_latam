import 'package:flutter/material.dart';

import '../../../../entities/match/match.dart';
import '../../../../entities/match/player_score.dart';

class TeamMatchItem extends StatelessWidget {
  const TeamMatchItem({
    required this.match,
    required this.playerScore,
    super.key,
  });

  final Match match;
  final PlayerScore playerScore;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(
              flex: 30,
              child: Text(
                match.firstTeam.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              flex: 20,
              child: Text(
                '${match.firstTeamScore ?? 0} : ${match.secondTeamScore ?? 0}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              flex: 30,
              child: Text(
                match.secondTeam.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              flex: 20,
              child: Text(
                playerScore.formatted,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
