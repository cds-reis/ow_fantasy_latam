import 'package:flutter/material.dart';

import '../../entities/leaderboard_entry.dart';

class LeaderboardItem extends StatelessWidget {
  const LeaderboardItem({
    required this.entry,
    required this.onEnter,
    super.key,
  });
  final LeaderboardEntry entry;

  final VoidCallback onEnter;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onEnter,
      child: MouseRegion(
        cursor: SystemMouseCursors.basic,
        onEnter: (_) => onEnter(),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color(0xFF424446),
          ),
          child: Row(
            children: [
              Expanded(
                child: _LeaderboardItemText(text: entry.rank.toString()),
              ),
              Expanded(
                flex: 2,
                child: _LeaderboardItemText(text: entry.username),
              ),
              Expanded(
                child: _LeaderboardItemText(text: entry.totalScore.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LeaderboardItemText extends StatelessWidget {
  const _LeaderboardItemText({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}
