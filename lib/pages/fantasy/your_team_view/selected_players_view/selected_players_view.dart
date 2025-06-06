import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/season_provider.dart';
import '../../../../providers/user_roster/user_roster_provider.dart';
import 'selected_player_item.dart';

class SelectedPlayersView extends ConsumerWidget {
  const SelectedPlayersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roster = ref.watch(
      userRosterProvider(ref.watch(selectedSeasonProvider)),
    );

    return SelectionArea(
      child: roster.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Text(error.toString()),
        data: (roster) => DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              spacing: 8,
              children: [
                SelectedPlayerItem.tank(player: roster.tank),
                SelectedPlayerItem.damage(player: roster.firstDamage),
                SelectedPlayerItem.damage(player: roster.secondDamage),
                SelectedPlayerItem.support(player: roster.firstSupport),
                SelectedPlayerItem.support(player: roster.secondSupport),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
