import 'package:flutter/material.dart';

import 'game_week_view.dart';
import 'selected_players_view/selected_players_view.dart';
import 'submit_or_reset_roster_view.dart';

class YourTeamView extends StatelessWidget {
  const YourTeamView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GameWeekView(),
        SubmitOrResetRosterView(),
        SelectedPlayersView(),
      ],
    );
  }
}
