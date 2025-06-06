// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'player_role.dart';

class PlayerRoleMapper extends EnumMapper<PlayerRole> {
  PlayerRoleMapper._();

  static PlayerRoleMapper? _instance;
  static PlayerRoleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PlayerRoleMapper._());
    }
    return _instance!;
  }

  static PlayerRole fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PlayerRole decode(dynamic value) {
    switch (value) {
      case r'tank':
        return PlayerRole.tank;
      case r'damage':
        return PlayerRole.damage;
      case r'support':
        return PlayerRole.support;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PlayerRole self) {
    switch (self) {
      case PlayerRole.tank:
        return r'tank';
      case PlayerRole.damage:
        return r'damage';
      case PlayerRole.support:
        return r'support';
    }
  }
}

extension PlayerRoleMapperExtension on PlayerRole {
  String toValue() {
    PlayerRoleMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PlayerRole>(this) as String;
  }
}
