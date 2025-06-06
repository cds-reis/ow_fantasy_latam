// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'player_score.dart';

class PlayerScoreMapper extends ClassMapperBase<PlayerScore> {
  PlayerScoreMapper._();

  static PlayerScoreMapper? _instance;
  static PlayerScoreMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PlayerScoreMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PlayerScore';

  static PlayerId _$playerId(PlayerScore v) => v.playerId;
  static const Field<PlayerScore, PlayerId> _f$playerId =
      Field('playerId', _$playerId, key: r'player_id');
  static double _$score(PlayerScore v) => v.score;
  static const Field<PlayerScore, double> _f$score = Field('score', _$score);

  @override
  final MappableFields<PlayerScore> fields = const {
    #playerId: _f$playerId,
    #score: _f$score,
  };

  static PlayerScore _instantiate(DecodingData data) {
    return PlayerScore(
        playerId: data.dec(_f$playerId), score: data.dec(_f$score));
  }

  @override
  final Function instantiate = _instantiate;

  static PlayerScore fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PlayerScore>(map);
  }

  static PlayerScore fromJson(String json) {
    return ensureInitialized().decodeJson<PlayerScore>(json);
  }
}

mixin PlayerScoreMappable {
  String toJson() {
    return PlayerScoreMapper.ensureInitialized()
        .encodeJson<PlayerScore>(this as PlayerScore);
  }

  Map<String, dynamic> toMap() {
    return PlayerScoreMapper.ensureInitialized()
        .encodeMap<PlayerScore>(this as PlayerScore);
  }

  PlayerScoreCopyWith<PlayerScore, PlayerScore, PlayerScore> get copyWith =>
      _PlayerScoreCopyWithImpl<PlayerScore, PlayerScore>(
          this as PlayerScore, $identity, $identity);
  @override
  String toString() {
    return PlayerScoreMapper.ensureInitialized()
        .stringifyValue(this as PlayerScore);
  }

  @override
  bool operator ==(Object other) {
    return PlayerScoreMapper.ensureInitialized()
        .equalsValue(this as PlayerScore, other);
  }

  @override
  int get hashCode {
    return PlayerScoreMapper.ensureInitialized().hashValue(this as PlayerScore);
  }
}

extension PlayerScoreValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PlayerScore, $Out> {
  PlayerScoreCopyWith<$R, PlayerScore, $Out> get $asPlayerScore =>
      $base.as((v, t, t2) => _PlayerScoreCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PlayerScoreCopyWith<$R, $In extends PlayerScore, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({PlayerId? playerId, double? score});
  PlayerScoreCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PlayerScoreCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PlayerScore, $Out>
    implements PlayerScoreCopyWith<$R, PlayerScore, $Out> {
  _PlayerScoreCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PlayerScore> $mapper =
      PlayerScoreMapper.ensureInitialized();
  @override
  $R call({PlayerId? playerId, double? score}) => $apply(FieldCopyWithData({
        if (playerId != null) #playerId: playerId,
        if (score != null) #score: score
      }));
  @override
  PlayerScore $make(CopyWithData data) => PlayerScore(
      playerId: data.get(#playerId, or: $value.playerId),
      score: data.get(#score, or: $value.score));

  @override
  PlayerScoreCopyWith<$R2, PlayerScore, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PlayerScoreCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
