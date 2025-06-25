import 'package:flutter/material.dart';

import '../../../entities/leaderboard_entry.dart';
import 'user_roster.dart';

class UserRostersView extends StatelessWidget {
  const UserRostersView({required this.entry, super.key});

  final LeaderboardEntry? entry;

  @override
  Widget build(BuildContext context) {
    final entry = this.entry;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0xFF26282B),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            const Text(
              'Rosters',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (entry != null)
              Text(
                entry.username,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (entry != null) UserRoster(entry: entry),
          ],
        ),
      ),
    );
  }
}
