import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_provider.dart';

part 'all_players_query_provider.g.dart';

typedef AllAvailablePlayers =
    PostgrestFilterBuilder<List<Map<String, dynamic>>>;

@riverpod
AllAvailablePlayers allPlayersQuery(Ref ref) {
  final supabase = ref.watch(supabaseProvider);
  return supabase.rpc<List<Map<String, dynamic>>>('get_all_players');
}
