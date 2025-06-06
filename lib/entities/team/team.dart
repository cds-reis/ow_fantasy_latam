import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';

import 'team_id.dart';
import 'team_name.dart';

part 'team.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class Team with TeamMappable, EquatableMixin {
  const Team({required this.id, required this.name});

  final TeamId id;
  final TeamName name;

  @override
  List<Object?> get props => [id, name];
}
