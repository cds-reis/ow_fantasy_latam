import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';

import '../team/team.dart';
import '../team/team_id.dart';
import '../team/team_name.dart';
import 'match_id.dart';
import 'player_score.dart';

part 'match.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase, hook: MatchHook())
class Match with MatchMappable, EquatableMixin {
  const Match({
    required this.id,
    required this.matchTime,
    required this.firstTeam,
    required this.secondTeam,
    required this.playerScores,
    required this.isCompleted,
    this.firstTeamScore,
    this.secondTeamScore,
  });

  final MatchId id;
  final DateTime matchTime;
  final Team firstTeam;
  final Team secondTeam;
  final int? firstTeamScore;
  final int? secondTeamScore;
  final List<PlayerScore> playerScores;
  final bool isCompleted;

  String get formatted => '${firstTeam.name} X ${secondTeam.name}';

  @override
  List<Object?> get props => [
    matchTime,
    firstTeam,
    secondTeam,
    firstTeamScore,
    secondTeamScore,
    playerScores,
    isCompleted,
  ];
}

class MatchHook extends MappingHook {
  const MatchHook();

  @override
  Object? beforeDecode(Object? value) {
    if (value case {
      'first_team': {
        'teams': {
          'id': final int firstTeamId,
          'name': final String firstTeamName,
        },
      },
      'second_team': {
        'teams': {
          'id': final int secondTeamId,
          'name': final String secondTeamName,
        },
      },
    }) {
      return {
        ...?super.beforeDecode(value) as Map<String, dynamic>?,
        'first_team': {
          'id': TeamId(firstTeamId),
          'name': TeamName(firstTeamName),
        },
        'second_team': {
          'id': TeamId(secondTeamId),
          'name': TeamName(secondTeamName),
        },
      };
    }

    throw Exception('Invalid match data: $value');
  }
}
