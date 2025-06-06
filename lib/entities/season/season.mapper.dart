// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'season.dart';

class SeasonMapper extends ClassMapperBase<Season> {
  SeasonMapper._();

  static SeasonMapper? _instance;
  static SeasonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SeasonMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Season';

  static SeasonId _$id(Season v) => v.id;
  static const Field<Season, SeasonId> _f$id = Field('id', _$id);
  static String _$name(Season v) => v.name;
  static const Field<Season, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Season> fields = const {
    #id: _f$id,
    #name: _f$name,
  };

  static Season _instantiate(DecodingData data) {
    return Season(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Season fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Season>(map);
  }

  static Season fromJson(String json) {
    return ensureInitialized().decodeJson<Season>(json);
  }
}

mixin SeasonMappable {
  String toJson() {
    return SeasonMapper.ensureInitialized().encodeJson<Season>(this as Season);
  }

  Map<String, dynamic> toMap() {
    return SeasonMapper.ensureInitialized().encodeMap<Season>(this as Season);
  }

  SeasonCopyWith<Season, Season, Season> get copyWith =>
      _SeasonCopyWithImpl<Season, Season>(this as Season, $identity, $identity);
  @override
  String toString() {
    return SeasonMapper.ensureInitialized().stringifyValue(this as Season);
  }

  @override
  bool operator ==(Object other) {
    return SeasonMapper.ensureInitialized().equalsValue(this as Season, other);
  }

  @override
  int get hashCode {
    return SeasonMapper.ensureInitialized().hashValue(this as Season);
  }
}

extension SeasonValueCopy<$R, $Out> on ObjectCopyWith<$R, Season, $Out> {
  SeasonCopyWith<$R, Season, $Out> get $asSeason =>
      $base.as((v, t, t2) => _SeasonCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SeasonCopyWith<$R, $In extends Season, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({SeasonId? id, String? name});
  SeasonCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SeasonCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Season, $Out>
    implements SeasonCopyWith<$R, Season, $Out> {
  _SeasonCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Season> $mapper = SeasonMapper.ensureInitialized();
  @override
  $R call({SeasonId? id, String? name}) => $apply(FieldCopyWithData(
      {if (id != null) #id: id, if (name != null) #name: name}));
  @override
  Season $make(CopyWithData data) => Season(
      id: data.get(#id, or: $value.id), name: data.get(#name, or: $value.name));

  @override
  SeasonCopyWith<$R2, Season, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SeasonCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
