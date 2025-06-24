import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/match/match.dart';
import '../../entities/team/team.dart';
import 'matches_provider.dart';

part 'matches_for_team_provider.g.dart';

@riverpod
Future<IList<Match>> matchesForTeam(Ref ref, Team team) async {
  ref.keepAlive();

  final matches = await ref
      .watch(matchesQueryProvider)
      .or('team_a_id.eq.${team.id},team_b_id.eq.${team.id}')
      .order('match_time');

  final iList = matches.map(MatchMapper.fromMap).toIList();

  return iList;
}
