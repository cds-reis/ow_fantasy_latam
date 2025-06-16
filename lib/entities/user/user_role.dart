import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';

import 'user_role_name.dart';

part 'user_role.mapper.dart';

@MappableClass()
class UserRole with UserRoleMappable, EquatableMixin {
  const UserRole({
    required this.name,
  });

  final UserRoleName name;

  @override
  List<Object?> get props => [name];
}
