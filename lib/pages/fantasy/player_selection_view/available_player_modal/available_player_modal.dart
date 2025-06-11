import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../entities/player/player.dart';
import '../../../../providers/matches_for_team_provider.dart';
import '../../../../utils/build_context_extensions.dart';
import '../../../../widgets/player_role_icon.dart';
import 'player_image_display.dart';
import 'player_matches.dart';
import 'player_matches_header.dart';
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
                    _PlayerNameAndRole(player: player),
                    _PlayerCostAndTeam(player: player),
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
                  _PlayerNameAndRole(player: player),
                  _PlayerCostAndTeam(player: player),
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

class _PlayerCostAndTeam extends StatelessWidget {
  const _PlayerCostAndTeam({required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
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
    );
  }
}

class _PlayerNameAndRole extends StatelessWidget {
  const _PlayerNameAndRole({required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
