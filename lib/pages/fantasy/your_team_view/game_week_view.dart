import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../entities/roster/roster.dart';
import '../../../providers/season_provider.dart';
import '../../../providers/user_roster/user_roster_provider.dart';
import '../../../utils/hardstring.dart';

class GameWeekView extends ConsumerWidget {
  const GameWeekView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roster = ref
        .watch(userRosterProvider(ref.watch(selectedSeasonProvider)))
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
                  if (roster == null)
                    const Expanded(
                      child: GameWeekItem(label: 'Cost', value: '...'),
                    )
                  else
                    Expanded(
                      child: GameWeekItem(
                        label: 'Roster Cost',
                        value: '${roster.cost} / ${Roster.maxCost}',
                      ),
                    ),
                  const VerticalDivider(color: Colors.white, width: 5),
                  Expanded(
                    child: GameWeekItem(
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
  const GameWeekItem({required this.label, required this.value, super.key});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Gap(8),
        Text(value, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
