import 'package:flutter/material.dart';

import 'available_players/available_players_view.dart';
import 'filter_by_widget.dart';
import 'max_cost_widget.dart';
import 'player_sorting_widget.dart';
import 'search_players_widget.dart';

class PlayerSelectionView extends StatelessWidget {
  const PlayerSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Player Selection',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              spacing: 16,
              children: [
                FilterByWidget(),
                PlayerSortingWidget(),
                MaxCostWidget(),
                SearchPlayersWidget(),
                AvailablePlayersView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
