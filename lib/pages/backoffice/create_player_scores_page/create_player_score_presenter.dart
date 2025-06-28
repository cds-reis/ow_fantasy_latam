import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

import '../../../entities/player/player.dart';

part 'create_player_score_state.dart';

class CreatePlayerScorePresenter extends ValueNotifier<CreatePlayerScoreState> {
  CreatePlayerScorePresenter()
    : super(
        InsertingScores._(
          playerScores: IList(Iterable.generate(5, (_) => null)),
        ),
      );

  void add() {
    value = value.add();
  }

  void remove(int index) {
    value = value.remove(index);
  }

  void addPlayer(int index, Player player) {
    value = value.addPlayer(index, player);
  }

  void addScore(Player player, double score) {
    value = value.addScore(player, score);
  }

  void reset() {
    value = InsertingScores._(
      playerScores: IList(Iterable.generate(5, (_) => null)),
    );
  }
}
