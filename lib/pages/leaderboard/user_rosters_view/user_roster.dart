import 'package:flutter/material.dart';

import '../../../entities/leaderboard_entry.dart';
import 'user_roster_header.dart';
import 'user_roster_row.dart';

class UserRoster extends StatelessWidget {
  const UserRoster({required this.entry, super.key});

  final LeaderboardEntry entry;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        for (final roster in entry.rosters) ...[
          ColoredBox(
            color: const Color(0xFF424446),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  UserRosterHeader(roster: roster),
                  UserRosterRow(roster: roster),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
