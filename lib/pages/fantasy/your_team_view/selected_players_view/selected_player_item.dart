import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../entities/player/player.dart';
import '../../../../entities/player/player_role.dart';
import '../../../../entities/player_selection_filter.dart';
import '../../player_selection_view/available_player_modal/available_player_modal.dart';
import '../../player_selection_view/filter_by_widget.dart';

class SelectedPlayerItem extends ConsumerWidget {
  const SelectedPlayerItem.tank({required this.player, super.key})
    : role = PlayerRole.tank;

  const SelectedPlayerItem.damage({required this.player, super.key})
    : role = PlayerRole.damage;

  const SelectedPlayerItem.support({required this.player, super.key})
    : role = PlayerRole.support;

  final PlayerRole role;
  final Player? player;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: Row(
        spacing: 24,
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/${role.name.toLowerCase()}.png',
              height: 100,
              width: 100,
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
            flex: 8,
            child: Material(
              color: Colors.red.shade700,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: switch (player) {
                  null => () {
                    ref
                        .read(filterByProvider.notifier)
                        .setFilter(FilterByRole(role: role));
                  },
                  final Player player => () {
                    showAvailablePlayerModal(context, player);
                  },
                },
                child: Row(
                  children: [
                    const Spacer(flex: 2),
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              switch (player) {
                                null => 'Select a player',
                                Player(:final name, :final teamName) =>
                                  '$name ($teamName)',
                              },
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Cost: ${player?.cost ?? 0}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Divider(color: Colors.white, thickness: 1),
                            Text(
                              'Latest Score: ${player?.latestScore.formatted ?? 0}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Total Score: ${player?.totalScore.formatted ?? 0}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
