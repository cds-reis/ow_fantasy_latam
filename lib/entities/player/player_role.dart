import 'package:dart_mappable/dart_mappable.dart';

part 'player_role.mapper.dart';

@MappableEnum()
enum PlayerRole {
  tank('Tank'),
  damage('DPS'),
  support('Support');

  const PlayerRole(this.title);

  final String title;
}
