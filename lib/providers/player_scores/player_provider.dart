import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/player/player.dart';
import '../../entities/player/player_id.dart';
import '../all_players_query_provider.dart';

part 'player_provider.g.dart';

@riverpod
Future<Player> player(Ref ref, PlayerId id) async {
  final player = await ref.watch(allPlayersQueryProvider).eq('id', id).single();

  return PlayerMapper.fromMap(player);
}
