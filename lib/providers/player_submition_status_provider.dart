import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/match/match.dart';
import '../entities/player/player.dart';
import '../entities/roster/roster.dart';
import 'supabase_provider.dart';

part 'player_submition_status_provider.g.dart';

@riverpod
Future<PlayerSubmitionStatus> playerSubmitionStatus(
  Ref ref,
  PlayerSubmitionRequest request,
) async {
  final supabase = ref.watch(supabaseProvider);
  final response = await supabase.functions.invoke(
    'get-roster-submition-deadline',
  );

  final isPastDeadline =
      (response.data as Map<String, dynamic>)['is_past_deadline'] as bool;

  if (isPastDeadline) {
    return PlayerSubmitionStatus.rosterSubmitionDeadlineReached;
  }

  final roster = request.roster;
  final now = DateTime.parse(
    (response.data as Map<String, dynamic>)['now'] as String,
  );

  final weekMonday = now
      .subtract(Duration(days: now.weekday - 1))
      .copyWith(
        hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );

  final weekSunday = weekMonday
      .add(const Duration(days: 7))
      .copyWith(
        hour: 3,
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );

  final matchesThisWeek = request.matches.where((match) {
    return match.matchTime.isAfter(weekMonday) &&
        match.matchTime.isBefore(weekSunday);
  }).toIList();

  final hasPlayerPlayedThisWeek = matchesThisWeek.any((match) {
    return now.isAfter(match.matchTime);
  });

  if (hasPlayerPlayedThisWeek) {
    return PlayerSubmitionStatus.playerAlreadyPlayedThisWeek;
  }

  if (roster.hasPlayer(request.player)) {
    return PlayerSubmitionStatus.removePlayer;
  }

  if (!roster.hasSpaceForRole(request.player.role)) {
    return PlayerSubmitionStatus.maximumNumberOfPlayersForRole;
  }

  return PlayerSubmitionStatus.submitPlayer;
}

class PlayerSubmitionRequest extends Equatable {
  const PlayerSubmitionRequest({
    required this.player,
    required this.matches,
    required this.roster,
  });

  final Player player;
  final IList<Match> matches;
  final Roster roster;

  @override
  List<Object?> get props => [player, matches, roster];
}

enum PlayerSubmitionStatus {
  submitPlayer,
  removePlayer,
  maximumNumberOfPlayersForRole,
  playerAlreadyPlayedThisWeek,
  rosterSubmitionDeadlineReached,
}
