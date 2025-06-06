import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../entities/player/player.dart';
import '../../../../providers/is_player_playing_right_now.dart';
import '../../../../providers/matches_for_team_provider.dart';
import '../../../../providers/season_provider.dart';
import '../../../../providers/user_roster_provider.dart';
import '../../../../widgets/player_role_icon.dart';
import 'add_player_to_roster_button.dart';
import 'maximum_number_of_players_for_role.dart';
import 'player_is_playing_right_now.dart';
import 'player_matches.dart';
import 'player_matches_header.dart';
import 'remove_player_from_roster_button.dart';
import 'score_breakdown.dart';

void showAvailablePlayerModal(BuildContext context, Player player) {
  showDialog<void>(
    context: context,
    builder: (context) => Dialog(
      shape: const BeveledRectangleBorder(
        side: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: AvailablePlayerModal(player: player),
    ),
  );
}

class AvailablePlayerModal extends ConsumerWidget {
  const AvailablePlayerModal({required this.player, super.key});

  final Player player;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roster = ref
        .watch(userRosterProvider(ref.watch(selectedSeasonProvider)))
        .requireValue;

    final matches = ref.watch(matchesForTeamProvider(player.team));

    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                spacing: 24,
                children: [
                  const SizedBox.square(dimension: 300, child: Placeholder()),
                  switch (()) {
                    _ when matches.isLoading => const SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    _ when matches.hasError => const SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: Center(child: Text('Error loading matches')),
                    ),
                    _
                        when ref.watch(
                          isPlayerPlayingRightNowProvider(
                            player,
                            matches.requireValue,
                          ),
                        ) =>
                      PlayerIsPlayingRightNowButton(player: player),
                    _ when roster.hasPlayer(player) =>
                      RemovePlayerFromRosterButton(player: player),
                    _ when roster.hasSpaceForRole(player.role) =>
                      AddPlayerToRosterButton(player: player),
                    _ => MaximumNumberOfPlayersForRole(role: player.role),
                  },
                  Expanded(child: ScoreBreakdown(player: player)),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                spacing: 24,
                children: [
                  Row(
                    spacing: 16,
                    children: [
                      PlayerRoleIcon(role: player.role, size: 50),
                      Text(
                        player.name,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 16,
                    children: [
                      Text(
                        'Cost: ${player.cost},',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Team: ${player.teamName}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      spacing: 16,
                      children: [
                        const PlayerMatchesHeader(),
                        Expanded(
                          child: PlayerMatches(
                            player: player,
                            matches: matches,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const CloseButton(),
          ],
        ),
      ),
    );
  }
}
