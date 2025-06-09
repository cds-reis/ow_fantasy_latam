import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/season_provider.dart';
import '../../../../widgets/page_indicator.dart';
import '../filter_by_widget.dart';
import '../max_cost_widget.dart';
import '../player_sorting_widget.dart';
import '../search_players_widget.dart';
import 'available_player_item.dart';
import 'filtered_available_players_provider.dart';

class AvailablePlayersView extends ConsumerWidget {
  const AvailablePlayersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = filteredAvailablePlayersProvider(
      season: ref.watch(selectedSeasonProvider),
      filter: ref.watch(filterByProvider),
      sorting: ref.watch(availablePlayerSortingProvider),
      maxCost: ref.watch(maxCostProvider),
      searchQuery: ref.watch(searchPlayerByNameQueryProvider),
    );

    final availablePlayers = ref.watch(provider);

    return availablePlayers.when(
      data: (players) {
        var page = 0;
        const pageSize = 12;

        return StatefulBuilder(
          builder: (context, setState) {
            final sublist = players
                .skip(page * pageSize)
                .take(pageSize)
                .toList();
            final maxPage = (players.length / pageSize).ceil();

            return Column(
              spacing: 8,
              children: [
                const AvailablePlayerItemHeader(),
                for (final player in sublist)
                  AvailablePlayerItem(player: player),
                PageIndicator(
                  page: players.isEmpty ? 0 : page + 1,
                  maxPage: maxPage,
                  onPageBack: switch (page) {
                    0 => null,
                    _ => () => setState(() => page -= 1),
                  },
                  onPageForward: switch (()) {
                    _ when page + 1 >= maxPage => null,
                    _ => () => setState(() => page += 1),
                  },
                ),
              ],
            );
          },
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
