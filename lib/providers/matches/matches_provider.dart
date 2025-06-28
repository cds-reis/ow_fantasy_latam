import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../entities/match/match.dart';
import '../supabase_provider.dart';

part 'matches_provider.g.dart';

@riverpod
Future<IList<Match>> matches(Ref ref) async {
  ref.keepAlive();
  final matches = await ref.watch(matchesQueryProvider);

  final iList = matches.map(MatchMapper.fromMap).toIList();

  return iList;
}

@riverpod
PostgrestFilterBuilder<List<Map<String, dynamic>>> matchesQuery(Ref ref) {
  return ref.watch(supabaseProvider).from('matches').select('''
        id,
        match_time,
        first_team_score:team_a_score,
        second_team_score:team_b_score,
        first_team:season_teams!matches_team_a_id_fkey( teams!inner ( id , name) ),
        second_team:season_teams!matches_team_b_id_fkey( teams!inner ( id , name) ),
        player_scores: player_scores ( player_id, score ),
        is_completed
      ''');
}
