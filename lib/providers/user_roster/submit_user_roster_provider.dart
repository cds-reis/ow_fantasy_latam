import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/exceptions/roster_creation_exception.dart';
import '../../entities/roster/roster.dart';
import '../supabase_provider.dart';
import 'user_roster_provider.dart';
import 'user_transfers_provider.dart';

part 'submit_user_roster_provider.g.dart';

@riverpod
Future<void> submitUserRoster(Ref ref, Roster roster) async {
  final supabase = ref.watch(supabaseProvider);

  final user = supabase.auth.currentUser!;
  final seasonId = roster.seasonId;

  final table = supabase.from('fantasy_rosters');
  final exists = ref.watch(userRosterExistsProvider(seasonId));

  if (!roster.isFull) {
    throw const RosterIsNotFullException();
  }

  final ids = [
    ?roster.tank?.id,
    ?roster.firstDamage?.id,
    ?roster.secondDamage?.id,
    ?roster.firstSupport?.id,
    ?roster.secondSupport?.id,
  ];

  if (ids.toSet().length != ids.length) {
    throw const SamePlayersInTheTeamException();
  }

  if (exists) {
    final transfers = await ref.watch(userTransfersProvider(seasonId).future);
    if (!transfers.hasSpace) {
      throw const NoTransfersAvailableException();
    }

    await supabase.functions.invoke(
      'update-fantasy-roster',
      queryParameters: {'season_id': seasonId.value.toString()},
      body: {
        'tank_id': roster.tank?.id,
        'first_dps_id': roster.firstDamage?.id,
        'second_dps_id': roster.secondDamage?.id,
        'first_support_id': roster.firstSupport?.id,
        'second_support_id': roster.secondSupport?.id,
      },
    );

    ref.invalidate(userRosterProvider(seasonId));
  } else {
    await table.insert({
      'id': user.id,
      'season_id': seasonId.value,
      'tank_id': roster.tank?.id,
      'first_dps_id': roster.firstDamage?.id,
      'second_dps_id': roster.secondDamage?.id,
      'first_support_id': roster.firstSupport?.id,
      'second_support_id': roster.secondSupport?.id,
    });

    await supabase.from('fantasy_roster_details').insert({
      'id': user.id,
      'season_id': seasonId.value,
    });
  }
}
