import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/season/season_id.dart';

part 'user_roster_exists.g.dart';

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
