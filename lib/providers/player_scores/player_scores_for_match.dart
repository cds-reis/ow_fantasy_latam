import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/match/match_id.dart';
import '../../entities/player_score_for_match.dart';
import 'player_scores_provider.dart';

part 'player_scores_for_match.g.dart';

@riverpod
Future<IList<PlayerScoreForMatch>> playerScoresForMatch(
  Ref ref,
  MatchId matchId,
) async {
  final playerScores = await ref
      .watch(playerScoresQueryProvider)
      .eq('match_id', matchId);

  return playerScores.map(PlayerScoreForMatchMapper.fromMap).toIList();
}
