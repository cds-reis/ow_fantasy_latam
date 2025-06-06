import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../entities/player/player.dart';
import '../entities/roster/roster.dart';
import '../entities/season/season.dart';
import 'supabase_provider.dart';

part 'user_roster_provider.g.dart';

@riverpod
class UserRosterExists extends _$UserRosterExists {
  @override
  bool build() {
    ref.keepAlive();
    return false;
  }

  void set({required bool exists}) {
    state = exists;
  }
}

@riverpod
class UserRoster extends _$UserRoster {
  @override
  Future<Roster> build(Season season) async {
    ref.keepAlive();
    final supabase = ref.watch(supabaseProvider);

    final response = await supabase.functions.invoke(
      'get-fantasy-roster',
      method: HttpMethod.get,
      queryParameters: {
        'season_id': season.id.value.toString(),
      },
    );

    final roster = response.data as Map<String, dynamic>;

    ref.read(userRosterExistsProvider.notifier).set(exists: roster.isNotEmpty);

    if (roster.isEmpty) {
      return Roster(
        tank: null,
        firstDamage: null,
        secondDamage: null,
        firstSupport: null,
        secondSupport: null,
        seasonId: season.id,
        totalScore: 0,
        transfers: 0,
      );
    }

    return RosterMapper.fromMap(roster);
  }

  Future<void> submit() async {
    final supabase = ref.read(supabaseProvider);

    final user = supabase.auth.currentUser!;
    final roster = state.requireValue;
    final seasonId = roster.seasonId;

    final table = supabase.from('fantasy_rosters');
    final exists = ref.read(userRosterExistsProvider);
    if (exists) {
      await table
          .update({
            'tank_id': roster.tank?.id,
            'first_dps_id': roster.firstDamage?.id,
            'second_dps_id': roster.secondDamage?.id,
            'first_support_id': roster.firstSupport?.id,
            'second_support_id': roster.secondSupport?.id,
          })
          .eq('id', user.id)
          .eq('season_id', seasonId.value);
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

  void addPlayer(Player player) {
    assert(
      state.requireValue.hasSpaceForRole(player.role),
      'Roster is already full for the ${player.role.name} role',
    );

    state = AsyncData(state.requireValue.addPlayer(player));
  }

  void removePlayer(Player player) {
    assert(
      state.requireValue.hasPlayer(player),
      'Roster does not have this player, so it cannot be removed',
    );

    state = AsyncData(state.requireValue.removePlayer(player));
  }

  void reset() {
    state = AsyncData(state.requireValue.reset());
  }
}
