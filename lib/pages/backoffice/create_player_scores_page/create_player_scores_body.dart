import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../entities/creating_player_scores/match_scores.dart';
import '../../../entities/match/match.dart';
import '../../../providers/player_scores/create_player_scores_provider.dart';
import '../../../providers/player_scores/player_scores_for_match.dart';
import '../../../widgets/show_error_dialog.dart';
import 'create_player_score_presenter.dart';
import 'player_score_form.dart';
import 'player_score_item.dart';
import 'show_create_player_scores_confirmation_dialog.dart';

class CreatePlayerScoresBody extends ConsumerStatefulWidget {
  const CreatePlayerScoresBody({
    required this.match,
    super.key,
  });

  final Match match;

  @override
  ConsumerState<CreatePlayerScoresBody> createState() =>
      _StateCreatePlayerScoresBody();
}

class _StateCreatePlayerScoresBody
    extends ConsumerState<CreatePlayerScoresBody> {
  late final CreatePlayerScorePresenter _firstTeamPresenter;
  late final CreatePlayerScorePresenter _secondTeamPresenter;

  @override
  void initState() {
    super.initState();
    _firstTeamPresenter = CreatePlayerScorePresenter();
    _secondTeamPresenter = CreatePlayerScorePresenter();
  }

  @override
  void dispose() {
    _firstTeamPresenter.dispose();
    _secondTeamPresenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final match = widget.match;
    final matchId = match.id;

    final playerScores = ref.watch(playerScoresForMatchProvider(matchId));

    return playerScores.when(
      data: (playerScores) {
        if (playerScores.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 400,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        '${match.firstTeam.name} ${match.firstTeamScore} : ${match.secondTeamScore} ${match.secondTeam.name}',
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    const Divider(),
                    for (final playerScore in playerScores)
                      PlayerScoreItem(playerScore: playerScore),
                  ],
                ),
              ),
            ),
          );
        }

        return Column(
          spacing: 16,
          children: [
            IntrinsicHeight(
              child: Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: PlayerScoreForm(
                      team: match.firstTeam,
                      matchId: matchId,
                      presenter: _firstTeamPresenter,
                    ),
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: PlayerScoreForm(
                      team: match.secondTeam,
                      matchId: matchId,
                      presenter: _secondTeamPresenter,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _createPlayerScores,
              child: const Text('Submit'),
            ),
          ],
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Future<void> _createPlayerScores() async {
    final firstMatchScores = _firstTeamPresenter.value.parse();
    final secondMatchScores = _secondTeamPresenter.value.parse();
    final scores = firstMatchScores.flatMap(
      (a) => secondMatchScores.map((b) => (a, b)),
    );

    switch (scores) {
      case Right(
        value: (final firstTeamScores, final secondTeamScores),
      ):
        final match = widget.match;
        final matchScores = MatchScores(
          matchId: match.id,
          firstTeamScores: firstTeamScores,
          secondTeamScores: secondTeamScores,
        );

        final confirmed = await showCreatePlayerScoresConfirmationDialog(
          context: context,
          match: match,
          matchScores: matchScores,
        );

        if (confirmed) {
          try {
            await ref.read(
              createPlayerScoresProvider(matchScores).future,
            );
            ref.invalidate(playerScoresForMatchProvider(match.id));
          } on Exception catch (e) {
            if (mounted) {
              showErrorDialog(
                context: context,
                errorMessage: e.toString(),
              );
            }
          }
        }
      case Left(value: final error):
        final errorMessage = switch (error) {
          EmptyScore() => 'Empty score',
          MissingPlayerScores(:final missingPlayers) =>
            'Missing player scores: ${missingPlayers.map((player) => player.name).join(', ')}',
          DuplicatePlayerIds(:final duplicatePlayers) =>
            'Duplicate players: ${duplicatePlayers.map((player) => player.name).join(', ')}',
        };

        showErrorDialog(context: context, errorMessage: errorMessage);
    }
  }
}
