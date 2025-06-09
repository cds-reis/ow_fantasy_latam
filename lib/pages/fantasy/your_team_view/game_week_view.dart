import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/roster_deadline_provider.dart';
import '../../../providers/season_provider.dart';
import '../../../providers/user_roster/user_roster_provider.dart';
import '../../../utils/format_readable_date.dart';
import '../../../utils/hardstring.dart';

class GameWeekView extends ConsumerWidget {
  const GameWeekView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roster = ref
        .watch(userRosterProvider(ref.watch(selectedSeasonProvider).id))
        .valueOrNull;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 4),
              child: Text(
                'Gameweek'.hardString,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GameWeekItem(
                      label: 'Total Score',
                      value: roster?.totalScore.toString() ?? '...',
                    ),
                  ),
                  const VerticalDivider(color: Colors.white, width: 5),
                  Expanded(
                    child: Consumer(
                      builder: (context, ref, child) {
                        final deadline = ref
                            .watch(rosterDeadlineProvider)
                            .valueOrNull;

                        return GameWeekItem(
                          label: 'Deadline',
                          value: deadline != null
                              ? formatReadableDate(deadline.deadline)
                              : '...',
                        );
                      },
                    ),
                  ),
                  const VerticalDivider(color: Colors.white, width: 5),
                  Expanded(
                    child: GameWeekItem.highlighted(
                      label: 'Budget',
                      value: roster != null ? roster.budget.toString() : '...',
                    ),
                  ),
                  const VerticalDivider(color: Colors.white, width: 5),
                  Expanded(
                    child: GameWeekItem.highlighted(
                      label: 'Transfers',
                      value: roster?.transfers.toString() ?? '...',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GameWeekItem extends StatelessWidget {
  const GameWeekItem({
    required this.label,
    required this.value,
    super.key,
  }) : highlighted = false;

  const GameWeekItem.highlighted({
    required this.label,
    required this.value,
    super.key,
  }) : highlighted = true;

  final String label;
  final String value;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: highlighted ? Colors.green.shade700 : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: highlighted ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
