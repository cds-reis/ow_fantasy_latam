import 'dart:async';
import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../entities/match/match.dart';
import '../../../entities/player/player.dart';
import '../../../providers/matches/matches_for_week_provider.dart';
import '../../../providers/player_scores/player_scores_for_match.dart';
import '../../../providers/supabase_provider.dart';
import 'create_player_score_presenter.dart';
import 'player_score_form.dart';

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
    final playerScores = ref.watch(
      playerScoresForMatchProvider(widget.match.id),
    );

    return playerScores.when(
      data: (playerScores) {
        if (playerScores.isNotEmpty) {
          return const Center(
            child: Text(
              'There are already player scores for this match',
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
                      team: widget.match.firstTeam,
                      matchId: widget.match.id,
                      presenter: _firstTeamPresenter,
                    ),
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: PlayerScoreForm(
                      team: widget.match.secondTeam,
                      matchId: widget.match.id,
                      presenter: _secondTeamPresenter,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final scores = _parseScores(
                  _firstTeamPresenter,
                  _secondTeamPresenter,
                );

                switch (scores) {
                  case Right(value: final matchScores):
                    final match = ref.read(selectedMatchProvider)!;
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Confirmation'),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          spacing: 16,
                          children: [
                            const Text(
                              'Are you sure you want to submit the scores?',
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 16,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 8,
                                    children: [
                                      Text(match.firstTeam.name),
                                      for (final score
                                          in matchScores
                                              .firstTeamScores
                                              .playerScores)
                                        Text('${score.$1.name}: ${score.$2}'),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 8,
                                    children: [
                                      Text(match.secondTeam.name),
                                      for (final score
                                          in matchScores
                                              .secondTeamScores
                                              .playerScores)
                                        Text('${score.$1.name}: ${score.$2}'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    );

                    if (confirmed ?? false) {
                      final supabase = ref.read(supabaseProvider);
                      final result = await supabase.functions.invoke(
                        'create-player-scores',
                        body: {
                          'match_id': match.id,
                          'scores': matchScores.toJson(),
                        },
                      );
                    }
                  case Left(value: final error):
                    final errorMessage = switch (error) {
                      EmptyScore() => 'Empty score',
                      MissingPlayerScores(:final missingPlayers) =>
                        'Missing player scores: ${missingPlayers.map((player) => player.name).join(', ')}',
                      DuplicatePlayerIds(:final duplicatePlayers) =>
                        'Duplicate players: ${duplicatePlayers.map((player) => player.name).join(', ')}',
                    };

                    unawaited(
                      showDialog<void>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Error'),
                          content: Text(errorMessage),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                    );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

Either<BuildingScoresError, MatchScores> _parseScores(
  CreatePlayerScorePresenter firstTeamPresenter,
  CreatePlayerScorePresenter secondTeamPresenter,
) {
  return Either.Do((
    $,
  ) {
    final firstTeamScores = $(
      firstTeamPresenter.value.parse(),
    );
    final secondTeamScores = $(
      secondTeamPresenter.value.parse(),
    );

    return MatchScores._(
      firstTeamScores: firstTeamScores,
      secondTeamScores: secondTeamScores,
    );
  });
}

class MatchScores extends Equatable {
  const MatchScores._({
    required this.firstTeamScores,
    required this.secondTeamScores,
  });

  final SubmittableScores firstTeamScores;
  final SubmittableScores secondTeamScores;

  UnmodifiableListView<(Player player, double score)> get allScores =>
      UnmodifiableListView([
        ...firstTeamScores.playerScores,
        ...secondTeamScores.playerScores,
      ]);

  List<Map<String, dynamic>> toJson() => allScores
      .map((score) => {'player_id': score.$1.id, 'score': score.$2})
      .toList();

  @override
  List<Object?> get props => [
    firstTeamScores,
    secondTeamScores,
  ];
}
