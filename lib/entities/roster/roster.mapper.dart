// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'roster.dart';

class RosterMapper extends ClassMapperBase<Roster> {
  RosterMapper._();

  static RosterMapper? _instance;
  static RosterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RosterMapper._());
      PlayerMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Roster';

  static Player? _$tank(Roster v) => v.tank;
  static const Field<Roster, Player> _f$tank = Field('tank', _$tank);
  static Player? _$firstDamage(Roster v) => v.firstDamage;
  static const Field<Roster, Player> _f$firstDamage =
      Field('firstDamage', _$firstDamage, key: r'first_damage');
  static Player? _$secondDamage(Roster v) => v.secondDamage;
  static const Field<Roster, Player> _f$secondDamage =
      Field('secondDamage', _$secondDamage, key: r'second_damage');
  static Player? _$firstSupport(Roster v) => v.firstSupport;
  static const Field<Roster, Player> _f$firstSupport =
      Field('firstSupport', _$firstSupport, key: r'first_support');
  static Player? _$secondSupport(Roster v) => v.secondSupport;
  static const Field<Roster, Player> _f$secondSupport =
      Field('secondSupport', _$secondSupport, key: r'second_support');
  static SeasonId _$seasonId(Roster v) => v.seasonId;
  static const Field<Roster, SeasonId> _f$seasonId =
      Field('seasonId', _$seasonId, key: r'season_id');
  static double _$totalScore(Roster v) => v.totalScore;
  static const Field<Roster, double> _f$totalScore =
      Field('totalScore', _$totalScore, key: r'total_score');
  static int _$transfers(Roster v) => v.transfers;
  static const Field<Roster, int> _f$transfers =
      Field('transfers', _$transfers);

  @override
  final MappableFields<Roster> fields = const {
    #tank: _f$tank,
    #firstDamage: _f$firstDamage,
    #secondDamage: _f$secondDamage,
    #firstSupport: _f$firstSupport,
    #secondSupport: _f$secondSupport,
    #seasonId: _f$seasonId,
    #totalScore: _f$totalScore,
    #transfers: _f$transfers,
  };

  static Roster _instantiate(DecodingData data) {
    return Roster(
        tank: data.dec(_f$tank),
        firstDamage: data.dec(_f$firstDamage),
        secondDamage: data.dec(_f$secondDamage),
        firstSupport: data.dec(_f$firstSupport),
        secondSupport: data.dec(_f$secondSupport),
        seasonId: data.dec(_f$seasonId),
        totalScore: data.dec(_f$totalScore),
        transfers: data.dec(_f$transfers));
  }

  @override
  final Function instantiate = _instantiate;

  static Roster fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Roster>(map);
  }

  static Roster fromJson(String json) {
    return ensureInitialized().decodeJson<Roster>(json);
  }
}

mixin RosterMappable {
  String toJson() {
    return RosterMapper.ensureInitialized().encodeJson<Roster>(this as Roster);
  }

  Map<String, dynamic> toMap() {
    return RosterMapper.ensureInitialized().encodeMap<Roster>(this as Roster);
  }

  RosterCopyWith<Roster, Roster, Roster> get copyWith =>
      _RosterCopyWithImpl<Roster, Roster>(this as Roster, $identity, $identity);
  @override
  String toString() {
    return RosterMapper.ensureInitialized().stringifyValue(this as Roster);
  }

  @override
  bool operator ==(Object other) {
    return RosterMapper.ensureInitialized().equalsValue(this as Roster, other);
  }

  @override
  int get hashCode {
    return RosterMapper.ensureInitialized().hashValue(this as Roster);
  }
}

extension RosterValueCopy<$R, $Out> on ObjectCopyWith<$R, Roster, $Out> {
  RosterCopyWith<$R, Roster, $Out> get $asRoster =>
      $base.as((v, t, t2) => _RosterCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RosterCopyWith<$R, $In extends Roster, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  PlayerCopyWith<$R, Player, Player>? get tank;
  PlayerCopyWith<$R, Player, Player>? get firstDamage;
  PlayerCopyWith<$R, Player, Player>? get secondDamage;
  PlayerCopyWith<$R, Player, Player>? get firstSupport;
  PlayerCopyWith<$R, Player, Player>? get secondSupport;
  $R call(
      {Player? tank,
      Player? firstDamage,
      Player? secondDamage,
      Player? firstSupport,
      Player? secondSupport,
      SeasonId? seasonId,
      double? totalScore,
      int? transfers});
  RosterCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RosterCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Roster, $Out>
    implements RosterCopyWith<$R, Roster, $Out> {
  _RosterCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Roster> $mapper = RosterMapper.ensureInitialized();
  @override
  PlayerCopyWith<$R, Player, Player>? get tank =>
      $value.tank?.copyWith.$chain((v) => call(tank: v));
  @override
  PlayerCopyWith<$R, Player, Player>? get firstDamage =>
      $value.firstDamage?.copyWith.$chain((v) => call(firstDamage: v));
  @override
  PlayerCopyWith<$R, Player, Player>? get secondDamage =>
      $value.secondDamage?.copyWith.$chain((v) => call(secondDamage: v));
  @override
  PlayerCopyWith<$R, Player, Player>? get firstSupport =>
      $value.firstSupport?.copyWith.$chain((v) => call(firstSupport: v));
  @override
  PlayerCopyWith<$R, Player, Player>? get secondSupport =>
      $value.secondSupport?.copyWith.$chain((v) => call(secondSupport: v));
  @override
  $R call(
          {Object? tank = $none,
          Object? firstDamage = $none,
          Object? secondDamage = $none,
          Object? firstSupport = $none,
          Object? secondSupport = $none,
          SeasonId? seasonId,
          double? totalScore,
          int? transfers}) =>
      $apply(FieldCopyWithData({
        if (tank != $none) #tank: tank,
        if (firstDamage != $none) #firstDamage: firstDamage,
        if (secondDamage != $none) #secondDamage: secondDamage,
        if (firstSupport != $none) #firstSupport: firstSupport,
        if (secondSupport != $none) #secondSupport: secondSupport,
        if (seasonId != null) #seasonId: seasonId,
        if (totalScore != null) #totalScore: totalScore,
        if (transfers != null) #transfers: transfers
      }));
  @override
  Roster $make(CopyWithData data) => Roster(
      tank: data.get(#tank, or: $value.tank),
      firstDamage: data.get(#firstDamage, or: $value.firstDamage),
      secondDamage: data.get(#secondDamage, or: $value.secondDamage),
      firstSupport: data.get(#firstSupport, or: $value.firstSupport),
      secondSupport: data.get(#secondSupport, or: $value.secondSupport),
      seasonId: data.get(#seasonId, or: $value.seasonId),
      totalScore: data.get(#totalScore, or: $value.totalScore),
      transfers: data.get(#transfers, or: $value.transfers));

  @override
  RosterCopyWith<$R2, Roster, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RosterCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
