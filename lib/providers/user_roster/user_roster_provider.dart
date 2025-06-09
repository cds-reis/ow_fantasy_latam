import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../entities/player/player.dart';
import '../../entities/roster/roster.dart';
import '../../entities/season/season_id.dart';
import '../supabase_provider.dart';

part 'user_roster_provider.g.dart';

@riverpod
class OriginalUserRoster extends _$OriginalUserRoster {
  @override
  IMap<SeasonId, Roster> build() {
    ref.keepAlive();
    return const IMap.empty();
  }

  void add(Roster roster) {
    state = state.add(roster.seasonId, roster);
  }
}

@riverpod
class UserRosterExists extends _$UserRosterExists {
  @override
  bool build(SeasonId seasonId) {
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
  Future<Roster> build(SeasonId seasonId) async {
    ref.keepAlive();
    final supabase = ref.watch(supabaseProvider);

    final response = await supabase.functions.invoke(
      'get-fantasy-roster',
      method: HttpMethod.get,
      queryParameters: {
        'season_id': seasonId.value.toString(),
      },
    );

    final mapRoster = response.data as Map<String, dynamic>;

    if (mapRoster['tank'] == null) {
      final roster = Roster.empty(seasonId: seasonId);
      ref.read(originalUserRosterProvider.notifier).add(roster);
      return roster;
    }

    final roster = RosterMapper.fromMap(mapRoster);

    ref.read(userRosterExistsProvider(seasonId).notifier).set(exists: true);
    ref.read(originalUserRosterProvider.notifier).add(roster);

    return roster;
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
    state = AsyncData(ref.read(originalUserRosterProvider)[seasonId]!);
  }
}
