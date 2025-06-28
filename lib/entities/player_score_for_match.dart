import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';

import 'match/match_id.dart';
import 'player/player_id.dart';

part 'player_score_for_match.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class PlayerScoreForMatch with PlayerScoreForMatchMappable, EquatableMixin {
  const PlayerScoreForMatch({
    required this.playerId,
    required this.matchId,
    required this.score,
  });

  final PlayerId playerId;
  final MatchId matchId;
  final double score;

  String get formatted => score.toStringAsFixed(1);

  @override
  List<Object?> get props => [playerId, matchId, score];
}
