import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/match/match.dart';
import '../entities/team/team.dart';
import 'supabase_provider.dart';

part 'matches_for_team_provider.g.dart';

@riverpod
Future<IList<Match>> matchesForTeam(Ref ref, Team team) async {
  ref.keepAlive();
  final supabase = ref.watch(supabaseProvider);

  final matches = await supabase
      .from('matches')
      .select('''
        match_time,
        first_team_score:team_a_score,
        second_team_score:team_b_score,
        first_team:season_teams!matches_team_a_id_fkey( teams!inner ( id , name) ),
        second_team:season_teams!matches_team_b_id_fkey( teams!inner ( id , name) ),
        player_scores: player_scores ( player_id, score ),
        is_completed
      ''')
      .or('team_a_id.eq.${team.id},team_b_id.eq.${team.id}')
      .order('match_time');

  final iList = matches.map(MatchMapper.fromMap).toIList();

  return iList;
}
