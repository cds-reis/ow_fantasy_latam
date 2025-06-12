import 'package:equatable/equatable.dart';

import 'player/player_role.dart';
import 'team/team.dart';

sealed class PlayerSelectionFilter extends Equatable {
  const PlayerSelectionFilter();

  String get label;

  @override
  List<Object?> get props => [];
}

final class FilterByRole extends PlayerSelectionFilter {
  const FilterByRole({required this.role});

  static const List<FilterByRole> values = [
    FilterByRole(role: PlayerRole.tank),
    FilterByRole(role: PlayerRole.damage),
    FilterByRole(role: PlayerRole.support),
  ];

  final PlayerRole role;

  @override
  String get label => role.title;

  @override
  List<Object?> get props => [role];
}

final class FilterByTeam extends PlayerSelectionFilter {
  const FilterByTeam({required this.team});

  final Team team;

  @override
  List<Object?> get props => [team];

  @override
  String get label => team.name;
}
