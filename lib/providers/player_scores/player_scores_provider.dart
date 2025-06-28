import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../entities/player_score_for_match.dart';
import '../supabase_provider.dart';

part 'player_scores_provider.g.dart';

@riverpod
Future<IList<PlayerScoreForMatch>> playerScores(Ref ref) async {
  final playerScores = await ref.watch(playerScoresQueryProvider);

  return playerScores.map(PlayerScoreForMatchMapper.fromMap).toIList();
}

@riverpod
PostgrestFilterBuilder<List<Map<String, dynamic>>> playerScoresQuery(Ref ref) {
  return ref
      .watch(supabaseProvider)
      .from('player_scores')
      .select('match_id, player_id, score');
}
