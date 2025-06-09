import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';

part 'roster_deadline.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class RosterDeadline with RosterDeadlineMappable, EquatableMixin {
  const RosterDeadline({
    required this.deadline,
    required this.now,
    required this.isPastDeadline,
  });

  final DateTime deadline;
  final DateTime now;
  final bool isPastDeadline;

  @override
  List<Object?> get props => [deadline, now, isPastDeadline];
}
