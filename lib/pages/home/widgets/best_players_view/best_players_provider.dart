import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../entities/player/player.dart';
import '../../../../entities/season/season.dart';
import '../../../../providers/all_players_query_provider.dart';

part 'best_players_provider.g.dart';

@riverpod
Future<List<Player>> bestPlayers(Ref ref, Season season) async {
  ref.keepAlive();
  final response = await ref
      .watch(allPlayersQueryProvider)
      .eq('season_id', season.id.value)
      .order('latest_score')
      .limit(10);

  return response.map(PlayerMapper.fromMap).toList();
}
