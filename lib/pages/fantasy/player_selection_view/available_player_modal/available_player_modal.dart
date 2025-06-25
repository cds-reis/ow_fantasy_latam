import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../entities/player/player.dart';
import '../../../../providers/matches_for_team_provider.dart';
import '../../../../utils/build_context_extensions.dart';
import 'player_cost_and_team.dart';
import 'player_image_display.dart';
import 'player_matches.dart';
import 'player_matches_header.dart';
import 'player_name_and_role.dart';
import 'player_submit_or_remove_button/player_submit_or_remove_button.dart';
import 'score_breakdown.dart';

void showAvailablePlayerModal(BuildContext context, Player player) {
  showDialog<void>(
    context: context,
    builder: (context) => Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      insetPadding: const EdgeInsets.all(8),
      child: AvailablePlayerModal(player: player),
    ),
  );
}

class AvailablePlayerModal extends ConsumerWidget {
  const AvailablePlayerModal({required this.player, super.key});

  final Player player;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matches = ref.watch(matchesForTeamProvider(player.team));

    if (context.isMobile) {
      return SizedBox(
        width: context.mobileBreakpoint,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: PlayerImageDisplay(player: player),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 16,
                  children: [
                    const Align(
                      alignment: Alignment.topRight,
                      child: CloseButton(),
                    ),
                    PlayerNameAndRole(player: player),
                    PlayerCostAndTeam(player: player),
                    PlayerSubmitOrRemoveButton(player: player),
                    ScoreBreakdown(player: player),
                    const PlayerMatchesHeader(),
                    PlayerMatches(
                      player: player,
                      matches: matches,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SizedBox(
      width: clampDouble(
        MediaQuery.sizeOf(context).width * 0.7,
        600,
        double.infinity,
      ),
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
                  PlayerImageDisplay(player: player),
                  PlayerSubmitOrRemoveButton(player: player),
                  Expanded(child: ScoreBreakdown(player: player)),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                spacing: 24,
                children: [
                  PlayerNameAndRole(player: player),
                  PlayerCostAndTeam(player: player),
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
