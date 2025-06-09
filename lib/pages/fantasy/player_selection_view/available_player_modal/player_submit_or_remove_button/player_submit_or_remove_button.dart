import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../entities/player/player.dart';
import '../../../../../providers/matches_for_team_provider.dart';
import '../../../../../providers/player_submition_status_provider.dart';
import '../../../../../providers/season_provider.dart';
import '../../../../../providers/user_roster/user_roster_provider.dart';
import 'add_player_to_roster_button.dart';
import 'maximum_number_of_players_for_role.dart';
import 'player_already_played_this_week.dart';
import 'player_roster_submition_deadline_reached.dart';
import 'remove_player_from_roster_button.dart';

class PlayerSubmitOrRemoveButton extends ConsumerWidget {
  const PlayerSubmitOrRemoveButton({required this.player, super.key});

  final Player player;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matches = ref.watch(matchesForTeamProvider(player.team));

    if (matches.isLoading) {
      return const SizedBox(
        width: double.infinity,
        height: 48,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (matches.hasError) {
      return const SizedBox(
        width: double.infinity,
        height: 48,
        child: Center(child: Text('Error loading matches')),
      );
    }
    final roster = ref
        .watch(userRosterProvider(ref.watch(selectedSeasonProvider).id))
        .requireValue;

    final submitionStatus = ref.watch(
      playerSubmitionStatusProvider(
        PlayerSubmitionRequest(
          player: player,
          matches: matches.requireValue,
          roster: roster,
        ),
      ),
    );

    if (submitionStatus.isLoading) {
      return const SizedBox(
        width: double.infinity,
        height: 48,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (submitionStatus.hasError) {
      return const SizedBox(
        width: double.infinity,
        height: 48,
        child: Center(child: Text('Error loading submition status')),
      );
    }

    return switch (submitionStatus.requireValue) {
      PlayerSubmitionStatus.submitPlayer => AddPlayerToRosterButton(
        player: player,
      ),
      PlayerSubmitionStatus.removePlayer => RemovePlayerFromRosterButton(
        player: player,
      ),
      PlayerSubmitionStatus.maximumNumberOfPlayersForRole =>
        MaximumNumberOfPlayersForRole(role: player.role),
      PlayerSubmitionStatus.playerAlreadyPlayedThisWeek =>
        const PlayerAlreadyPlayedThisWeek(),
      PlayerSubmitionStatus.rosterSubmitionDeadlineReached =>
        const PlayerRosterSubmitionDeadlineReached(),
    };
  }
}
