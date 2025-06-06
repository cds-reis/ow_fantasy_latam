import 'package:dart_mappable/dart_mappable.dart';

import 'season_id.dart';

part 'season.mapper.dart';

@MappableClass()
class Season with SeasonMappable {
  const Season({required this.id, required this.name});

  final SeasonId id;
  final String name;

  @override
  String toString() => name;
}
