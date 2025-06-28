import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';

import '../season/season_id.dart';
import '../team/team.dart';
import '../team/team_id.dart';
import '../team/team_name.dart';
import 'latest_player_score.dart';
import 'player_cost.dart';
import 'player_id.dart';
import 'player_name.dart';
import 'player_role.dart';
import 'total_player_score.dart';

part 'player.mapper.dart';

@MappableClass(hook: PlayerHook(), caseStyle: CaseStyle.snakeCase)
class Player with PlayerMappable, EquatableMixin {
  const Player({
    required this.id,
    required this.name,
    required this.role,
    required this.cost,
    required this.team,
    required this.seasonId,
    required this.latestScore,
    required this.totalScore,
  });

  final PlayerId id;
  final PlayerName name;
  final PlayerRole role;
  final Team team;
  final PlayerCost cost;
  final SeasonId seasonId;
  final LatestScore latestScore;
  final TotalScore totalScore;

  TeamId get teamId => team.id;
  TeamName get teamName => team.name;

  @override
  List<Object?> get props => [
    id,
    name,
    role,
    cost,
    team,
    seasonId,
    latestScore,
    totalScore,
  ];
}

class PlayerHook extends MappingHook {
  const PlayerHook();

  @override
  Object? beforeDecode(Object? value) {
    if (value case {
      'team_id': final int teamId,
      'team_name': final String teamName,
    }) {
      return {
        'team': {
          'id': TeamId(teamId),
          'name': TeamName(teamName),
        },
        ...?super.beforeDecode(value) as Map<String, dynamic>?,
      };
    }
    return value;
  }
}
