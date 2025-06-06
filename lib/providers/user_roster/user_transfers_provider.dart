import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/roster/trasnfers_amount.dart';
import '../../entities/season/season_id.dart';
import '../supabase_provider.dart';

part 'user_transfers_provider.g.dart';

@riverpod
Future<TransfersAmount> userTransfers(Ref ref, SeasonId seasonId) async {
  final supabase = ref.watch(supabaseProvider);

  final user = supabase.auth.currentUser!;

  final response = await supabase
      .from('fantasy_roster_details')
      .select('transfers')
      .eq('id', user.id)
      .eq('season_id', seasonId.value)
      .maybeSingle();

  return TransfersAmount(response?['transfers'] as int? ?? 0);
}
