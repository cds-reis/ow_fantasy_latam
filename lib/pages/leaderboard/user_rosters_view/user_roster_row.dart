import 'package:flutter/material.dart';

import '../../../entities/leaderboard_entry.dart';

class UserRosterRow extends StatelessWidget {
  const UserRosterRow({required this.roster, super.key});

  final LeaderboardRoster roster;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            roster.totalScore.toString(),
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            roster.tankName,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            '${roster.firstDamageName} - ${roster.secondDamageName}',
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            '${roster.firstSupportName} - ${roster.secondSupportName}',
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
