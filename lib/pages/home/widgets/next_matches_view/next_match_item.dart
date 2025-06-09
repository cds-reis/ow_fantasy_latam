import 'package:flutter/material.dart';

import '../../../../entities/match/match.dart';
import '../../../../utils/format_readable_date.dart';

class NextMatchItem extends StatelessWidget {
  const NextMatchItem({required this.match, super.key});

  final Match match;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                formatReadableDate(match.matchTime),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(match.firstTeam.name, textAlign: TextAlign.center),
            ),
            Expanded(
              child: Text(
                '${match.firstTeamScore ?? ''} : ${match.secondTeamScore ?? ''}',
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(match.secondTeam.name, textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
