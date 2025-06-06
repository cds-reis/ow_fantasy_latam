import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';

part 'leaderboard_entry.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class LeaderboardEntry with LeaderboardEntryMappable, EquatableMixin {
  const LeaderboardEntry({
    required this.username,
    required this.rank,
    required this.totalScore,
    required this.rosters,
  });

  final String username;
  final int rank;
  final double totalScore;
  final List<LeaderboardRoster> rosters;

  @override
  List<Object?> get props => [username, rank, totalScore, rosters];
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class LeaderboardRoster with LeaderboardRosterMappable, EquatableMixin {
  const LeaderboardRoster({
    required this.tankName,
    required this.firstDamageName,
    required this.secondDamageName,
    required this.firstSupportName,
    required this.secondSupportName,
    required this.totalScore,
    required this.seasonName,
  });

  final String tankName;
  final String firstDamageName;
  final String secondDamageName;
  final String firstSupportName;
  final String secondSupportName;
  final double totalScore;
  final String seasonName;

  @override
  List<Object?> get props => [
    tankName,
    firstDamageName,
    secondDamageName,
    firstSupportName,
    secondSupportName,
    totalScore,
    seasonName,
  ];
}
