import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';
import '../player/player_id.dart';

part 'player_score.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class PlayerScore with PlayerScoreMappable, EquatableMixin {
  const PlayerScore({required this.playerId, required this.score});

  final PlayerId playerId;
  final double score;

  String get formatted => score.toStringAsFixed(1);

  @override
  List<Object?> get props => [playerId, score];
}
