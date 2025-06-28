import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/match/match_id.dart';
import '../../../entities/player/player.dart';
import '../../../entities/team/team.dart';
import '../../../providers/players_for_team_provider.dart';
import 'create_player_score_presenter.dart';

class PlayerScoreForm extends ConsumerWidget {
  const PlayerScoreForm({
    required this.team,
    required this.matchId,
    required this.presenter,
    super.key,
  });

  final Team team;
  final MatchId matchId;
  final CreatePlayerScorePresenter presenter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(playersForTeamProvider(team.id));

    return players.when(
      data: (players) => ValueListenableBuilder(
        valueListenable: presenter,
        child: Text(team.name, style: const TextStyle(fontSize: 18)),
        builder: (context, value, child) {
          final playerScores = value.playerScores;

          final addButtonVisible =
              value.canAdd && playerScores.length < players.length;
          return Column(
            spacing: 16,
            children: [
              ?child,
              for (final (index, player) in playerScores.indexed.map(
                (e) => (e.$1, e.$2?.$1),
              ))
                Row(
                  spacing: 8,
                  children: [
                    Flexible(
                      flex: 6,
                      child: Builder(
                        builder: (context) {
                          final availablePlayers = [
                            ?player,
                            ...players.where(
                              (player) => playerScores.none(
                                (score) => score?.$1 == player,
                              ),
                            ),
                          ];

                          return DropdownButtonFormField<Player>(
                            value: player,
                            items: [
                              for (final player in availablePlayers)
                                DropdownMenuItem(
                                  value: player,
                                  child: Text(player.name),
                                ),
                            ],
                            onChanged: (player) {
                              if (player != null) {
                                presenter.addPlayer(index, player);
                              }
                            },
                          );
                        },
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: TextField(
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: true,
                        ),
                        inputFormatters: [_scoreFormatter],
                        enabled: player != null,
                        onChanged: (value) {
                          if (double.tryParse(value) case final score?) {
                            presenter.addScore(
                              player!,
                              score,
                            );
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Score',
                        ),
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: value.canRemove
                            ? () => presenter.remove(index)
                            : null,
                        icon: const Icon(Icons.remove),
                      ),
                    ),
                  ],
                ),
              Visibility(
                visible: addButtonVisible,
                child: IconButton.filled(
                  onPressed: presenter.add,
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          );
        },
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

final _scoreFormatter = TextInputFormatter.withFunction(
  (oldValue, newValue) {
    final oldText = oldValue.text;
    final newText = newValue.text;

    return switch ((oldText, newText)) {
      (_, '') => TextEditingValue.empty,
      ('', '-') => newValue,
      (_, '-') => newValue,
      (_, final text) when double.tryParse(text) != null => newValue,
      _ => oldValue,
    };
  },
);
