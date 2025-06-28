import 'package:flutter/material.dart';

import '../../../entities/creating_player_scores/match_scores.dart';
import '../../../entities/match/match.dart';

Future<bool> showCreatePlayerScoresConfirmationDialog({
  required BuildContext context,
  required Match match,
  required MatchScores matchScores,
}) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Confirmation'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          const Text(
            'Are you sure you want to submit the scores?',
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(match.firstTeam.name),
                    for (final score
                        in matchScores.firstTeamScores.playerScores)
                      Text('${score.$1.name}: ${score.$2}'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(match.secondTeam.name),
                    for (final score
                        in matchScores.secondTeamScores.playerScores)
                      Text('${score.$1.name}: ${score.$2}'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Submit'),
        ),
      ],
    ),
  );

  return confirmed ?? false;
}
