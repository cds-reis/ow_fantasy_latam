import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/player/player.dart';
import '../entities/team/team_id.dart';
import 'all_players_query_provider.dart';

part 'players_for_team_provider.g.dart';

@riverpod
Future<IList<Player>> playersForTeam(Ref ref, TeamId teamId) async {
  final players = await ref
      .watch(allPlayersQueryProvider)
      .eq('team_id', teamId);

  return players.map(PlayerMapper.fromMap).toIList();
}
