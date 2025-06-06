// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'match.dart';

class MatchMapper extends ClassMapperBase<Match> {
  MatchMapper._();

  static MatchMapper? _instance;
  static MatchMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MatchMapper._());
      TeamMapper.ensureInitialized();
      PlayerScoreMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Match';

  static DateTime _$matchTime(Match v) => v.matchTime;
  static const Field<Match, DateTime> _f$matchTime =
      Field('matchTime', _$matchTime, key: r'match_time');
  static Team _$firstTeam(Match v) => v.firstTeam;
  static const Field<Match, Team> _f$firstTeam =
      Field('firstTeam', _$firstTeam, key: r'first_team');
  static Team _$secondTeam(Match v) => v.secondTeam;
  static const Field<Match, Team> _f$secondTeam =
      Field('secondTeam', _$secondTeam, key: r'second_team');
  static List<PlayerScore> _$playerScores(Match v) => v.playerScores;
  static const Field<Match, List<PlayerScore>> _f$playerScores =
      Field('playerScores', _$playerScores, key: r'player_scores');
  static bool _$isCompleted(Match v) => v.isCompleted;
  static const Field<Match, bool> _f$isCompleted =
      Field('isCompleted', _$isCompleted, key: r'is_completed');
  static int? _$firstTeamScore(Match v) => v.firstTeamScore;
  static const Field<Match, int> _f$firstTeamScore = Field(
      'firstTeamScore', _$firstTeamScore,
      key: r'first_team_score', opt: true);
  static int? _$secondTeamScore(Match v) => v.secondTeamScore;
  static const Field<Match, int> _f$secondTeamScore = Field(
      'secondTeamScore', _$secondTeamScore,
      key: r'second_team_score', opt: true);

  @override
  final MappableFields<Match> fields = const {
    #matchTime: _f$matchTime,
    #firstTeam: _f$firstTeam,
    #secondTeam: _f$secondTeam,
    #playerScores: _f$playerScores,
    #isCompleted: _f$isCompleted,
    #firstTeamScore: _f$firstTeamScore,
    #secondTeamScore: _f$secondTeamScore,
  };

  @override
  final MappingHook hook = const MatchHook();
  static Match _instantiate(DecodingData data) {
    return Match(
        matchTime: data.dec(_f$matchTime),
        firstTeam: data.dec(_f$firstTeam),
        secondTeam: data.dec(_f$secondTeam),
        playerScores: data.dec(_f$playerScores),
        isCompleted: data.dec(_f$isCompleted),
        firstTeamScore: data.dec(_f$firstTeamScore),
        secondTeamScore: data.dec(_f$secondTeamScore));
  }

  @override
  final Function instantiate = _instantiate;

  static Match fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Match>(map);
  }

  static Match fromJson(String json) {
    return ensureInitialized().decodeJson<Match>(json);
  }
}

mixin MatchMappable {
  String toJson() {
    return MatchMapper.ensureInitialized().encodeJson<Match>(this as Match);
  }

  Map<String, dynamic> toMap() {
    return MatchMapper.ensureInitialized().encodeMap<Match>(this as Match);
  }

  MatchCopyWith<Match, Match, Match> get copyWith =>
      _MatchCopyWithImpl<Match, Match>(this as Match, $identity, $identity);
  @override
  String toString() {
    return MatchMapper.ensureInitialized().stringifyValue(this as Match);
  }

  @override
  bool operator ==(Object other) {
    return MatchMapper.ensureInitialized().equalsValue(this as Match, other);
  }

  @override
  int get hashCode {
    return MatchMapper.ensureInitialized().hashValue(this as Match);
  }
}

extension MatchValueCopy<$R, $Out> on ObjectCopyWith<$R, Match, $Out> {
  MatchCopyWith<$R, Match, $Out> get $asMatch =>
      $base.as((v, t, t2) => _MatchCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MatchCopyWith<$R, $In extends Match, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  TeamCopyWith<$R, Team, Team> get firstTeam;
  TeamCopyWith<$R, Team, Team> get secondTeam;
  ListCopyWith<$R, PlayerScore,
      PlayerScoreCopyWith<$R, PlayerScore, PlayerScore>> get playerScores;
  $R call(
      {DateTime? matchTime,
      Team? firstTeam,
      Team? secondTeam,
      List<PlayerScore>? playerScores,
      bool? isCompleted,
      int? firstTeamScore,
      int? secondTeamScore});
  MatchCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MatchCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Match, $Out>
    implements MatchCopyWith<$R, Match, $Out> {
  _MatchCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Match> $mapper = MatchMapper.ensureInitialized();
  @override
  TeamCopyWith<$R, Team, Team> get firstTeam =>
      $value.firstTeam.copyWith.$chain((v) => call(firstTeam: v));
  @override
  TeamCopyWith<$R, Team, Team> get secondTeam =>
      $value.secondTeam.copyWith.$chain((v) => call(secondTeam: v));
  @override
  ListCopyWith<$R, PlayerScore,
          PlayerScoreCopyWith<$R, PlayerScore, PlayerScore>>
      get playerScores => ListCopyWith($value.playerScores,
          (v, t) => v.copyWith.$chain(t), (v) => call(playerScores: v));
  @override
  $R call(
          {DateTime? matchTime,
          Team? firstTeam,
          Team? secondTeam,
          List<PlayerScore>? playerScores,
          bool? isCompleted,
          Object? firstTeamScore = $none,
          Object? secondTeamScore = $none}) =>
      $apply(FieldCopyWithData({
        if (matchTime != null) #matchTime: matchTime,
        if (firstTeam != null) #firstTeam: firstTeam,
        if (secondTeam != null) #secondTeam: secondTeam,
        if (playerScores != null) #playerScores: playerScores,
        if (isCompleted != null) #isCompleted: isCompleted,
        if (firstTeamScore != $none) #firstTeamScore: firstTeamScore,
        if (secondTeamScore != $none) #secondTeamScore: secondTeamScore
      }));
  @override
  Match $make(CopyWithData data) => Match(
      matchTime: data.get(#matchTime, or: $value.matchTime),
      firstTeam: data.get(#firstTeam, or: $value.firstTeam),
      secondTeam: data.get(#secondTeam, or: $value.secondTeam),
      playerScores: data.get(#playerScores, or: $value.playerScores),
      isCompleted: data.get(#isCompleted, or: $value.isCompleted),
      firstTeamScore: data.get(#firstTeamScore, or: $value.firstTeamScore),
      secondTeamScore: data.get(#secondTeamScore, or: $value.secondTeamScore));

  @override
  MatchCopyWith<$R2, Match, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MatchCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
