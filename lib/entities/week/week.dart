import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';

part 'week.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class Week with WeekMappable, EquatableMixin {
  const Week({required this.id, required this.number});

  final WeekId id;
  final WeekNumber number;

  String get name => 'Week $number';

  @override
  List<Object?> get props => [id, number];
}

extension type const WeekId(int value) implements Object {}

extension type const WeekNumber(int value) implements Object {}
