import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';

import '../player/player.dart';
import '../player/player_role.dart';
import '../season/season_id.dart';
import 'trasnfers_amount.dart';

part 'roster.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class Roster with RosterMappable, EquatableMixin {
  const Roster({
    required this.tank,
    required this.firstDamage,
    required this.secondDamage,
    required this.firstSupport,
    required this.secondSupport,
    required this.seasonId,
    required this.totalScore,
    required this.transfers,
  });

  static const maxCost = 100;

  final Player? tank;
  final Player? firstDamage;
  final Player? secondDamage;
  final Player? firstSupport;
  final Player? secondSupport;
  final double totalScore;
  final TransfersAmount transfers;
  final SeasonId seasonId;

  bool hasPlayer(Player player) {
    return tank == player ||
        firstDamage == player ||
        secondDamage == player ||
        firstSupport == player ||
        secondSupport == player;
  }

  bool get isFull =>
      tank != null &&
      firstDamage != null &&
      secondDamage != null &&
      firstSupport != null &&
      secondSupport != null;

  int get cost {
    return [
      tank?.cost,
      firstDamage?.cost,
      secondDamage?.cost,
      firstSupport?.cost,
      secondSupport?.cost,
    ].fold(0, (sum, cost) => sum + (cost ?? 0));
  }

  bool hasSpaceForRole(PlayerRole role) {
    return switch (role) {
      PlayerRole.tank => tank == null,
      PlayerRole.damage => firstDamage == null || secondDamage == null,
      PlayerRole.support => firstSupport == null || secondSupport == null,
    };
  }

  bool get hasSpaceForTransfers => transfers.hasSpace;

  bool get onlyTwoOfSameTeam {
    final teams = [
      tank?.teamId,
      firstDamage?.teamId,
      secondDamage?.teamId,
      firstSupport?.teamId,
      secondSupport?.teamId,
    ];

    final ids = teams
        .map((e) => e?.value)
        .nonNulls
        .groupFoldBy<int, int>(
          (id) => id,
          (previous, element) => (previous ?? 0) + 1,
        );

    return ids.values.every((count) => count <= 2);
  }

  Roster addPlayer(Player player) {
    assert(
      !hasPlayer(player),
      'Roster already has this player, so it cannot be added',
    );

    assert(
      hasSpaceForRole(player.role),
      'Roster is already full for the ${player.role.name} role',
    );

    switch (player.role) {
      case PlayerRole.tank:
        return copyWith(tank: player);
      case PlayerRole.damage:
        if (firstDamage == null) {
          return copyWith(firstDamage: player);
        } else {
          return copyWith(secondDamage: player);
        }
      case PlayerRole.support:
        if (firstSupport == null) {
          return copyWith(firstSupport: player);
        } else {
          return copyWith(secondSupport: player);
        }
    }
  }

  Roster removePlayer(Player player) {
    assert(
      hasPlayer(player),
      'Roster does not have this player, so it cannot be removed',
    );

    if (player == tank) {
      return copyWith(tank: null);
    } else if (player == firstDamage) {
      return copyWith(firstDamage: null);
    } else if (player == secondDamage) {
      return copyWith(secondDamage: null);
    } else if (player == firstSupport) {
      return copyWith(firstSupport: null);
    } else {
      return copyWith(secondSupport: null);
    }
  }

  Roster reset() {
    return Roster(
      tank: null,
      firstDamage: null,
      secondDamage: null,
      firstSupport: null,
      secondSupport: null,
      seasonId: seasonId,
      totalScore: totalScore,
      transfers: transfers,
    );
  }

  @override
  List<Object?> get props => [
    tank,
    firstDamage,
    secondDamage,
    firstSupport,
    secondSupport,
    seasonId,
    totalScore,
  ];
}

class RosterHook extends MappingHook {
  const RosterHook();

  @override
  Object? beforeDecode(Object? value) {
    final players = List<Map<String, dynamic>>.from(
      (value! as Map<String, dynamic>)['players'] as List<dynamic>,
    );

    final tank = players.singleWhere((e) => e['role'] == 'tank');
    final [firstDamage, secondDamage] = players
        .where((e) => e['role'] == 'damage')
        .toList();
    final [firstSupport, secondSupport] = players
        .where((e) => e['role'] == 'support')
        .toList();

    return {
      'tank': tank,
      'first_damage': firstDamage,
      'second_damage': secondDamage,
      'first_support': firstSupport,
      'second_support': secondSupport,
      'season_id': tank['season_id'],
    };
  }
}
