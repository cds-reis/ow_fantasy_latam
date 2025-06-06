import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../providers/season_provider.dart';
import '../../../../utils/hardstring.dart';
import 'best_player_item.dart';
import 'best_players_provider.dart';

class BestPlayersView extends StatelessWidget {
  const BestPlayersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 16,
            children: [
              Text(
                'Best Players'.hardString,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Expanded(child: SeasonSelector()),
            ],
          ),
          const Gap(16),
          Consumer(
            builder: (context, ref, child) {
              final bestPlayersAsyncValue = ref.watch(
                bestPlayersProvider(ref.watch(selectedSeasonProvider)),
              );

              if (bestPlayersAsyncValue.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (bestPlayersAsyncValue.hasError) {
                return Center(
                  child: Text(bestPlayersAsyncValue.error.toString()),
                );
              }

              if (bestPlayersAsyncValue.requireValue.isEmpty) {
                return const Center(child: Text('No best players found'));
              }

              final bestPlayers = bestPlayersAsyncValue.requireValue;
              return Expanded(
                child: ListView.separated(
                  itemCount: bestPlayers.length,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    return BestPlayerItem(
                      player: bestPlayers[index],
                      index: index,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
