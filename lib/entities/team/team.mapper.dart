// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'team.dart';

class TeamMapper extends ClassMapperBase<Team> {
  TeamMapper._();

  static TeamMapper? _instance;
  static TeamMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TeamMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Team';

  static TeamId _$id(Team v) => v.id;
  static const Field<Team, TeamId> _f$id = Field('id', _$id);
  static TeamName _$name(Team v) => v.name;
  static const Field<Team, TeamName> _f$name = Field('name', _$name);

  @override
  final MappableFields<Team> fields = const {
    #id: _f$id,
    #name: _f$name,
  };

  static Team _instantiate(DecodingData data) {
    return Team(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Team fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Team>(map);
  }

  static Team fromJson(String json) {
    return ensureInitialized().decodeJson<Team>(json);
  }
}

mixin TeamMappable {
  String toJson() {
    return TeamMapper.ensureInitialized().encodeJson<Team>(this as Team);
  }

  Map<String, dynamic> toMap() {
    return TeamMapper.ensureInitialized().encodeMap<Team>(this as Team);
  }

  TeamCopyWith<Team, Team, Team> get copyWith =>
      _TeamCopyWithImpl<Team, Team>(this as Team, $identity, $identity);
  @override
  String toString() {
    return TeamMapper.ensureInitialized().stringifyValue(this as Team);
  }

  @override
  bool operator ==(Object other) {
    return TeamMapper.ensureInitialized().equalsValue(this as Team, other);
  }

  @override
  int get hashCode {
    return TeamMapper.ensureInitialized().hashValue(this as Team);
  }
}

extension TeamValueCopy<$R, $Out> on ObjectCopyWith<$R, Team, $Out> {
  TeamCopyWith<$R, Team, $Out> get $asTeam =>
      $base.as((v, t, t2) => _TeamCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TeamCopyWith<$R, $In extends Team, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({TeamId? id, TeamName? name});
  TeamCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TeamCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Team, $Out>
    implements TeamCopyWith<$R, Team, $Out> {
  _TeamCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Team> $mapper = TeamMapper.ensureInitialized();
  @override
  $R call({TeamId? id, TeamName? name}) => $apply(FieldCopyWithData(
      {if (id != null) #id: id, if (name != null) #name: name}));
  @override
  Team $make(CopyWithData data) => Team(
      id: data.get(#id, or: $value.id), name: data.get(#name, or: $value.name));

  @override
  TeamCopyWith<$R2, Team, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TeamCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
