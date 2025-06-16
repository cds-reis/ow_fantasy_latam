import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/roster/roster.dart';
import '../../entities/season/season_id.dart';

part 'original_user_roster.g.dart';

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

  int amountOfChanges(Roster newRoster) {
    final seasonId = newRoster.seasonId;
    final originalRoster = state[seasonId];

    if (originalRoster == null) {
      return 0;
    }

    return originalRoster.amountOfChanges(newRoster);
  }
}
