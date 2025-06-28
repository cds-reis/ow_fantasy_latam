import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/creating_player_scores/match_scores.dart';
import '../supabase_provider.dart';

part 'create_player_scores_provider.g.dart';

@riverpod
Future<void> createPlayerScores(Ref ref, MatchScores matchScores) async {
  final supabase = ref.watch(supabaseProvider);
  await supabase.functions.invoke(
    'create-player-scores',
    body: {
      'match_id': matchScores.matchId,
      'scores': matchScores.toJson(),
    },
  );
}
