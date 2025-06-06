// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'player.dart';

class PlayerMapper extends ClassMapperBase<Player> {
  PlayerMapper._();

  static PlayerMapper? _instance;
  static PlayerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PlayerMapper._());
      PlayerRoleMapper.ensureInitialized();
      TeamMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Player';

  static PlayerId _$id(Player v) => v.id;
  static const Field<Player, PlayerId> _f$id = Field('id', _$id);
  static PlayerName _$name(Player v) => v.name;
  static const Field<Player, PlayerName> _f$name = Field('name', _$name);
  static PlayerRole _$role(Player v) => v.role;
  static const Field<Player, PlayerRole> _f$role = Field('role', _$role);
  static PlayerCost _$cost(Player v) => v.cost;
  static const Field<Player, PlayerCost> _f$cost = Field('cost', _$cost);
  static Team _$team(Player v) => v.team;
  static const Field<Player, Team> _f$team = Field('team', _$team);
  static SeasonId _$seasonId(Player v) => v.seasonId;
  static const Field<Player, SeasonId> _f$seasonId =
      Field('seasonId', _$seasonId, key: r'season_id');
  static LatestScore _$latestScore(Player v) => v.latestScore;
  static const Field<Player, LatestScore> _f$latestScore =
      Field('latestScore', _$latestScore, key: r'latest_score');
  static TotalScore _$totalScore(Player v) => v.totalScore;
  static const Field<Player, TotalScore> _f$totalScore =
      Field('totalScore', _$totalScore, key: r'total_score');

  @override
  final MappableFields<Player> fields = const {
    #id: _f$id,
    #name: _f$name,
    #role: _f$role,
    #cost: _f$cost,
    #team: _f$team,
    #seasonId: _f$seasonId,
    #latestScore: _f$latestScore,
    #totalScore: _f$totalScore,
  };

  @override
  final MappingHook hook = const PlayerHook();
  static Player _instantiate(DecodingData data) {
    return Player(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        role: data.dec(_f$role),
        cost: data.dec(_f$cost),
        team: data.dec(_f$team),
        seasonId: data.dec(_f$seasonId),
        latestScore: data.dec(_f$latestScore),
        totalScore: data.dec(_f$totalScore));
  }

  @override
  final Function instantiate = _instantiate;

  static Player fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Player>(map);
  }

  static Player fromJson(String json) {
    return ensureInitialized().decodeJson<Player>(json);
  }
}

mixin PlayerMappable {
  String toJson() {
    return PlayerMapper.ensureInitialized().encodeJson<Player>(this as Player);
  }

  Map<String, dynamic> toMap() {
    return PlayerMapper.ensureInitialized().encodeMap<Player>(this as Player);
  }

  PlayerCopyWith<Player, Player, Player> get copyWith =>
      _PlayerCopyWithImpl<Player, Player>(this as Player, $identity, $identity);
  @override
  String toString() {
    return PlayerMapper.ensureInitialized().stringifyValue(this as Player);
  }

  @override
  bool operator ==(Object other) {
    return PlayerMapper.ensureInitialized().equalsValue(this as Player, other);
  }

  @override
  int get hashCode {
    return PlayerMapper.ensureInitialized().hashValue(this as Player);
  }
}

extension PlayerValueCopy<$R, $Out> on ObjectCopyWith<$R, Player, $Out> {
  PlayerCopyWith<$R, Player, $Out> get $asPlayer =>
      $base.as((v, t, t2) => _PlayerCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PlayerCopyWith<$R, $In extends Player, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  TeamCopyWith<$R, Team, Team> get team;
  $R call(
      {PlayerId? id,
      PlayerName? name,
      PlayerRole? role,
      PlayerCost? cost,
      Team? team,
      SeasonId? seasonId,
      LatestScore? latestScore,
      TotalScore? totalScore});
  PlayerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PlayerCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Player, $Out>
    implements PlayerCopyWith<$R, Player, $Out> {
  _PlayerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Player> $mapper = PlayerMapper.ensureInitialized();
  @override
  TeamCopyWith<$R, Team, Team> get team =>
      $value.team.copyWith.$chain((v) => call(team: v));
  @override
  $R call(
          {PlayerId? id,
          PlayerName? name,
          PlayerRole? role,
          PlayerCost? cost,
          Team? team,
          SeasonId? seasonId,
          LatestScore? latestScore,
          TotalScore? totalScore}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (role != null) #role: role,
        if (cost != null) #cost: cost,
        if (team != null) #team: team,
        if (seasonId != null) #seasonId: seasonId,
        if (latestScore != null) #latestScore: latestScore,
        if (totalScore != null) #totalScore: totalScore
      }));
  @override
  Player $make(CopyWithData data) => Player(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      role: data.get(#role, or: $value.role),
      cost: data.get(#cost, or: $value.cost),
      team: data.get(#team, or: $value.team),
      seasonId: data.get(#seasonId, or: $value.seasonId),
      latestScore: data.get(#latestScore, or: $value.latestScore),
      totalScore: data.get(#totalScore, or: $value.totalScore));

  @override
  PlayerCopyWith<$R2, Player, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PlayerCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
