import 'dart:collection';

import 'package:equatable/equatable.dart';

import '../../pages/backoffice/create_player_scores_page/create_player_score_presenter.dart';
import '../match/match_id.dart';
import '../player/player.dart';

class MatchScores extends Equatable {
  const MatchScores({
    required this.matchId,
    required this.firstTeamScores,
    required this.secondTeamScores,
  });

  final MatchId matchId;
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
