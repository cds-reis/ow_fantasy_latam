import 'package:clock/clock.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/match/match.dart';
import '../entities/player/player.dart';

part 'is_player_playing_right_now.g.dart';

@riverpod
bool isPlayerPlayingRightNow(
  Ref ref,
  Player player,
  IList<Match> matches,
) {
  final now = clock.now();

  return matches.any((match) {
    final matchStart = match.matchTime;
    final matchEnd = matchStart.add(const Duration(hours: 4));
    return now.isAfter(matchStart) && now.isBefore(matchEnd);
  });
}
