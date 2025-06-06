import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../entities/leaderboard_entry.dart';
import 'supabase_provider.dart';

part 'leaderboard_provider.g.dart';

@riverpod
class Leaderboard extends _$Leaderboard {
  @override
  Future<List<LeaderboardEntry>> build() async {
    ref.keepAlive();
    final supabase = ref.watch(supabaseProvider);
    final leaderboard = await supabase.functions.invoke(
      'get-leaderboard',
      method: HttpMethod.get,
    );

    final leaderboardData = List<Map<String, dynamic>>.from(
      leaderboard.data as List<dynamic>,
    );

    return leaderboardData.map(LeaderboardEntryMapper.fromMap).toList();
  }
}
