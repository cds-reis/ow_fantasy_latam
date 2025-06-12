import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/team/team.dart';
import 'season_provider.dart';
import 'supabase_provider.dart';

part 'teams_provider.g.dart';

@riverpod
Future<IList<Team>> teams(Ref ref) async {
  ref.keepAlive();
  final supabase = ref.watch(supabaseProvider);
  final currentSeason = ref.watch(selectedSeasonProvider);

  final teams = await supabase
      .from('teams')
      .select('id, name, season_id:season_teams!inner(season_id)')
      .eq('season_teams.season_id', currentSeason.id.toString());

  return teams.map(TeamMapper.fromMap).toIList();
}
