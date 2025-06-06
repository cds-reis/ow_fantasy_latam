import 'package:flutter/material.dart';

import '../../providers/season_provider.dart';
import '../../utils/hardstring.dart';
import 'player_selection_view/player_selection_view.dart';
import 'your_team_view/your_team_view.dart';

class FantasyPage extends StatelessWidget {
  const FantasyPage({super.key});

  static const String routeName = '/fantasy';

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 1200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24,
        children: [
          Row(
            spacing: 24,
            children: [
              Expanded(
                flex: 8,
                child: Text(
                  'Your Face It LATAM Fantasy Team'.hardString,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Flexible(flex: 2, child: SeasonSelector()),
            ],
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              Expanded(flex: 65, child: YourTeamView()),
              Expanded(flex: 35, child: PlayerSelectionView()),
            ],
          ),
        ],
      ),
    );
  }
}
