import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

import '../../../entities/player/player.dart';

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
}

sealed class CreatePlayerScoreState extends Equatable {
  const CreatePlayerScoreState({
    required IList<(Player, double?)?> playerScores,
  }) : _playerScores = playerScores;

  final IList<(Player, double?)?> _playerScores;

  UnmodifiableListView<(Player, double?)?> get playerScores =>
      UnmodifiableListView(_playerScores);

  Either<BuildingScoresError, SubmittableScores> parse() {
    final hasEmtpyScore = _playerScores
        .where((score) => score == null)
        .isNotEmpty;

    if (hasEmtpyScore) {
      return const Left(EmptyScore());
    }

    final playerScores = _playerScores.nonNulls.toIList();

    final missingPlayerIds = playerScores
        .where((score) => score.$2 == null)
        .toIList();

    if (missingPlayerIds.isNotEmpty) {
      return Left(
        MissingPlayerScores(
          missingPlayers: missingPlayerIds.map((score) => score.$1).toList(),
        ),
      );
    }

    final duplicatePlayerIds = playerScores
        .groupListsBy((score) => score.$1)
        .entries
        .where((entry) => entry.value.length > 1)
        .map((entry) => entry.key);

    if (duplicatePlayerIds.isNotEmpty) {
      return Left(
        DuplicatePlayerIds(
          duplicatePlayers: duplicatePlayerIds.toList(),
        ),
      );
    }

    return Right(SubmittableScores._(playerScores: playerScores));
  }

  bool get canAdd => _playerScores.none((score) => score == null);
  bool get canRemove => _playerScores.length > 5;

  CreatePlayerScoreState add() {
    return InsertingScores._(playerScores: _playerScores.add(null));
  }

  CreatePlayerScoreState remove(int index) {
    assert(_playerScores.length > 5, 'Must have at least 5 players');

    return InsertingScores._(playerScores: _playerScores.removeAt(index));
  }

  CreatePlayerScoreState addPlayer(int index, Player player) {
    assert(
      _playerScores.map((element) => element?.$1).toList().indexOf(player) ==
              index ||
          _playerScores.none((score) => score?.$1 == player),
      'Player ID already exists',
    );

    return InsertingScores._(
      playerScores: _playerScores.replaceBy(
        index,
        (playerScore) => (player, playerScore?.$2),
      ),
    );
  }

  CreatePlayerScoreState addScore(Player player, double score) {
    assert(
      _playerScores.any((score) => score?.$1 == player),
      'Player ID does not exist',
    );

    return InsertingScores._(
      playerScores: _playerScores.replace(
        _playerScores.indexWhere((score) => score?.$1 == player),
        (player, score),
      ),
    );
  }

  @override
  List<Object?> get props => [_playerScores];
}

final class InsertingScores extends CreatePlayerScoreState {
  const InsertingScores._({required super.playerScores});
}

final class SubmittableScores extends CreatePlayerScoreState {
  const SubmittableScores._({required super.playerScores});

  @override
  UnmodifiableListView<(Player, double)> get playerScores =>
      UnmodifiableListView(
        super.playerScores
            .map((element) => element!)
            .map((element) => (element.$1, element.$2!)),
      );
}

sealed class BuildingScoresError extends Equatable {
  const BuildingScoresError();
}

final class EmptyScore extends BuildingScoresError {
  const EmptyScore();

  @override
  List<Object?> get props => [];
}

final class MissingPlayerScores extends BuildingScoresError {
  const MissingPlayerScores({required this.missingPlayers});

  final List<Player> missingPlayers;

  @override
  List<Object?> get props => [missingPlayers];
}

final class DuplicatePlayerIds extends BuildingScoresError {
  const DuplicatePlayerIds({required this.duplicatePlayers});

  final List<Player> duplicatePlayers;

  @override
  List<Object?> get props => [duplicatePlayers];
}
