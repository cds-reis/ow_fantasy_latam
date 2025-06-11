import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gap/gap.dart';

import '../../../../entities/player/player.dart';
import '../../../../entities/player/player_role.dart';
import '../../../../entities/player_selection_filter.dart';
import '../../../../utils/build_context_extensions.dart';
import '../../player_selection_view/available_player_modal/available_player_modal.dart';
import '../../player_selection_view/available_player_modal/player_image_display.dart';
import '../../player_selection_view/filter_by_widget.dart';
import '../../player_selection_view/player_selection_view.dart';

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
      height: 175,
      child: Row(
        spacing: 24,
        children: [
          if (context.width > 600)
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/images/${role.name.toLowerCase()}.png',
                height: 100,
                width: 100,
                fit: context.isMobile ? null : BoxFit.fitHeight,
              ),
            ),
          Expanded(
            flex: 8,
            child: Material(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.red.shade700,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: switch (player) {
                  null => () {
                    ref
                        .read(filterByProvider.notifier)
                        .setFilter(FilterByRole(role: role));
                    if (context.isMobile) {
                      showDialog<void>(
                        context: context,
                        builder: (context) {
                          return Dialog.fullscreen(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(24),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(Icons.arrow_back),
                                    label: const Text('Back to Roster'),
                                  ),
                                ),
                                const Expanded(
                                  child: SingleChildScrollView(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 24,
                                    ),
                                    child: PlayerSelectionView(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                  final Player player => () {
                    showAvailablePlayerModal(context, player);
                  },
                },
                child: Row(
                  children: [
                    if (!context.isMobile)
                      Expanded(
                        flex: 2,
                        child: Material(
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(16),
                          ),
                          color: Colors.black45,
                          child: Consumer(
                            builder: (context, ref, child) {
                              final player = this.player;
                              if (player == null) {
                                return const SizedBox.shrink();
                              }

                              final image = ref.watch(
                                playerImageProvider(player),
                              );

                              return switch (image) {
                                AsyncValue(value: Some(:final value)) =>
                                  Image.memory(value),
                                _ => const SizedBox(
                                  // height: double.infinity,
                                ),
                              };
                            },
                          ),
                        ),
                      ),
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
                                  '$name${!context.isMobile ? ' ($teamName)' : ''}',
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
