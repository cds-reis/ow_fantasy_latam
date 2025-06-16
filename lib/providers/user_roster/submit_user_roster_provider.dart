import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/exceptions/roster_creation_exception.dart';
import '../../entities/roster/roster.dart';
import '../supabase_provider.dart';
import 'original_user_roster.dart';
import 'user_roster_exists.dart';
import 'user_roster_provider.dart';
import 'user_transfers_provider.dart';

part 'submit_user_roster_provider.g.dart';

@riverpod
Future<void> submitUserRoster(Ref ref, Roster roster) async {
  final supabase = ref.watch(supabaseProvider);

  final seasonId = roster.seasonId;

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

  if (ref.watch(originalUserRosterProvider)[seasonId] == roster) {
    throw const RosterIsTheSameAsTheOriginalOneException();
  }

  if (ids.toSet().length != ids.length) {
    throw const SamePlayersInTheTeamException();
  }

  if (exists) {
    final transfers = await ref.watch(userTransfersProvider(seasonId).future);
    final amountOfChanges = ref
        .watch(originalUserRosterProvider.notifier)
        .amountOfChanges(roster);

    if (!transfers.hasSpace(amountOfChanges)) {
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
    await supabase.functions.invoke(
      'create-user-roster',
      queryParameters: {'season_id': seasonId.value.toString()},
      body: {
        'tank_id': roster.tank?.id,
        'first_dps_id': roster.firstDamage?.id,
        'second_dps_id': roster.secondDamage?.id,
        'first_support_id': roster.firstSupport?.id,
        'second_support_id': roster.secondSupport?.id,
      },
    );
    ref.read(userRosterExistsProvider(seasonId).notifier).set(exists: true);
    final newRoster = await ref.refresh(userRosterProvider(seasonId).future);
    ref.read(originalUserRosterProvider.notifier).add(newRoster);
  }
}
