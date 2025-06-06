import 'package:flutter/material.dart';

import '../../entities/leaderboard_entry.dart';

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
            if (entry != null) _UserRoster(entry: entry),
          ],
        ),
      ),
    );
  }
}

class _UserRoster extends StatelessWidget {
  const _UserRoster({required this.entry});

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
                  _UserRosterHeader(roster: roster),
                  _UserRosterRow(roster: roster),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _UserRosterHeader extends StatelessWidget {
  const _UserRosterHeader({required this.roster});

  final LeaderboardRoster roster;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Text(
          roster.seasonName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Row(
          children: [
            Expanded(
              child: Text(
                'Season Score',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Tank',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Damage',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Support',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _UserRosterRow extends StatelessWidget {
  const _UserRosterRow({required this.roster});

  final LeaderboardRoster roster;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            roster.totalScore.toString(),
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            roster.tankName,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            '${roster.firstDamageName} - ${roster.secondDamageName}',
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
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
