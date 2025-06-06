// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'leaderboard_entry.dart';

class LeaderboardEntryMapper extends ClassMapperBase<LeaderboardEntry> {
  LeaderboardEntryMapper._();

  static LeaderboardEntryMapper? _instance;
  static LeaderboardEntryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LeaderboardEntryMapper._());
      LeaderboardRosterMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LeaderboardEntry';

  static String _$username(LeaderboardEntry v) => v.username;
  static const Field<LeaderboardEntry, String> _f$username =
      Field('username', _$username);
  static int _$rank(LeaderboardEntry v) => v.rank;
  static const Field<LeaderboardEntry, int> _f$rank = Field('rank', _$rank);
  static double _$totalScore(LeaderboardEntry v) => v.totalScore;
  static const Field<LeaderboardEntry, double> _f$totalScore =
      Field('totalScore', _$totalScore, key: r'total_score');
  static List<LeaderboardRoster> _$rosters(LeaderboardEntry v) => v.rosters;
  static const Field<LeaderboardEntry, List<LeaderboardRoster>> _f$rosters =
      Field('rosters', _$rosters);

  @override
  final MappableFields<LeaderboardEntry> fields = const {
    #username: _f$username,
    #rank: _f$rank,
    #totalScore: _f$totalScore,
    #rosters: _f$rosters,
  };

  static LeaderboardEntry _instantiate(DecodingData data) {
    return LeaderboardEntry(
        username: data.dec(_f$username),
        rank: data.dec(_f$rank),
        totalScore: data.dec(_f$totalScore),
        rosters: data.dec(_f$rosters));
  }

  @override
  final Function instantiate = _instantiate;

  static LeaderboardEntry fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LeaderboardEntry>(map);
  }

  static LeaderboardEntry fromJson(String json) {
    return ensureInitialized().decodeJson<LeaderboardEntry>(json);
  }
}

mixin LeaderboardEntryMappable {
  String toJson() {
    return LeaderboardEntryMapper.ensureInitialized()
        .encodeJson<LeaderboardEntry>(this as LeaderboardEntry);
  }

  Map<String, dynamic> toMap() {
    return LeaderboardEntryMapper.ensureInitialized()
        .encodeMap<LeaderboardEntry>(this as LeaderboardEntry);
  }

  LeaderboardEntryCopyWith<LeaderboardEntry, LeaderboardEntry, LeaderboardEntry>
      get copyWith =>
          _LeaderboardEntryCopyWithImpl<LeaderboardEntry, LeaderboardEntry>(
              this as LeaderboardEntry, $identity, $identity);
  @override
  String toString() {
    return LeaderboardEntryMapper.ensureInitialized()
        .stringifyValue(this as LeaderboardEntry);
  }

  @override
  bool operator ==(Object other) {
    return LeaderboardEntryMapper.ensureInitialized()
        .equalsValue(this as LeaderboardEntry, other);
  }

  @override
  int get hashCode {
    return LeaderboardEntryMapper.ensureInitialized()
        .hashValue(this as LeaderboardEntry);
  }
}

extension LeaderboardEntryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LeaderboardEntry, $Out> {
  LeaderboardEntryCopyWith<$R, LeaderboardEntry, $Out>
      get $asLeaderboardEntry => $base
          .as((v, t, t2) => _LeaderboardEntryCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LeaderboardEntryCopyWith<$R, $In extends LeaderboardEntry, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, LeaderboardRoster,
          LeaderboardRosterCopyWith<$R, LeaderboardRoster, LeaderboardRoster>>
      get rosters;
  $R call(
      {String? username,
      int? rank,
      double? totalScore,
      List<LeaderboardRoster>? rosters});
  LeaderboardEntryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LeaderboardEntryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LeaderboardEntry, $Out>
    implements LeaderboardEntryCopyWith<$R, LeaderboardEntry, $Out> {
  _LeaderboardEntryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LeaderboardEntry> $mapper =
      LeaderboardEntryMapper.ensureInitialized();
  @override
  ListCopyWith<$R, LeaderboardRoster,
          LeaderboardRosterCopyWith<$R, LeaderboardRoster, LeaderboardRoster>>
      get rosters => ListCopyWith($value.rosters,
          (v, t) => v.copyWith.$chain(t), (v) => call(rosters: v));
  @override
  $R call(
          {String? username,
          int? rank,
          double? totalScore,
          List<LeaderboardRoster>? rosters}) =>
      $apply(FieldCopyWithData({
        if (username != null) #username: username,
        if (rank != null) #rank: rank,
        if (totalScore != null) #totalScore: totalScore,
        if (rosters != null) #rosters: rosters
      }));
  @override
  LeaderboardEntry $make(CopyWithData data) => LeaderboardEntry(
      username: data.get(#username, or: $value.username),
      rank: data.get(#rank, or: $value.rank),
      totalScore: data.get(#totalScore, or: $value.totalScore),
      rosters: data.get(#rosters, or: $value.rosters));

  @override
  LeaderboardEntryCopyWith<$R2, LeaderboardEntry, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LeaderboardEntryCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class LeaderboardRosterMapper extends ClassMapperBase<LeaderboardRoster> {
  LeaderboardRosterMapper._();

  static LeaderboardRosterMapper? _instance;
  static LeaderboardRosterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LeaderboardRosterMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LeaderboardRoster';

  static String _$tankName(LeaderboardRoster v) => v.tankName;
  static const Field<LeaderboardRoster, String> _f$tankName =
      Field('tankName', _$tankName, key: r'tank_name');
  static String _$firstDamageName(LeaderboardRoster v) => v.firstDamageName;
  static const Field<LeaderboardRoster, String> _f$firstDamageName =
      Field('firstDamageName', _$firstDamageName, key: r'first_damage_name');
  static String _$secondDamageName(LeaderboardRoster v) => v.secondDamageName;
  static const Field<LeaderboardRoster, String> _f$secondDamageName =
      Field('secondDamageName', _$secondDamageName, key: r'second_damage_name');
  static String _$firstSupportName(LeaderboardRoster v) => v.firstSupportName;
  static const Field<LeaderboardRoster, String> _f$firstSupportName =
      Field('firstSupportName', _$firstSupportName, key: r'first_support_name');
  static String _$secondSupportName(LeaderboardRoster v) => v.secondSupportName;
  static const Field<LeaderboardRoster, String> _f$secondSupportName = Field(
      'secondSupportName', _$secondSupportName,
      key: r'second_support_name');
  static double _$totalScore(LeaderboardRoster v) => v.totalScore;
  static const Field<LeaderboardRoster, double> _f$totalScore =
      Field('totalScore', _$totalScore, key: r'total_score');
  static String _$seasonName(LeaderboardRoster v) => v.seasonName;
  static const Field<LeaderboardRoster, String> _f$seasonName =
      Field('seasonName', _$seasonName, key: r'season_name');

  @override
  final MappableFields<LeaderboardRoster> fields = const {
    #tankName: _f$tankName,
    #firstDamageName: _f$firstDamageName,
    #secondDamageName: _f$secondDamageName,
    #firstSupportName: _f$firstSupportName,
    #secondSupportName: _f$secondSupportName,
    #totalScore: _f$totalScore,
    #seasonName: _f$seasonName,
  };

  static LeaderboardRoster _instantiate(DecodingData data) {
    return LeaderboardRoster(
        tankName: data.dec(_f$tankName),
        firstDamageName: data.dec(_f$firstDamageName),
        secondDamageName: data.dec(_f$secondDamageName),
        firstSupportName: data.dec(_f$firstSupportName),
        secondSupportName: data.dec(_f$secondSupportName),
        totalScore: data.dec(_f$totalScore),
        seasonName: data.dec(_f$seasonName));
  }

  @override
  final Function instantiate = _instantiate;

  static LeaderboardRoster fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LeaderboardRoster>(map);
  }

  static LeaderboardRoster fromJson(String json) {
    return ensureInitialized().decodeJson<LeaderboardRoster>(json);
  }
}

mixin LeaderboardRosterMappable {
  String toJson() {
    return LeaderboardRosterMapper.ensureInitialized()
        .encodeJson<LeaderboardRoster>(this as LeaderboardRoster);
  }

  Map<String, dynamic> toMap() {
    return LeaderboardRosterMapper.ensureInitialized()
        .encodeMap<LeaderboardRoster>(this as LeaderboardRoster);
  }

  LeaderboardRosterCopyWith<LeaderboardRoster, LeaderboardRoster,
          LeaderboardRoster>
      get copyWith =>
          _LeaderboardRosterCopyWithImpl<LeaderboardRoster, LeaderboardRoster>(
              this as LeaderboardRoster, $identity, $identity);
  @override
  String toString() {
    return LeaderboardRosterMapper.ensureInitialized()
        .stringifyValue(this as LeaderboardRoster);
  }

  @override
  bool operator ==(Object other) {
    return LeaderboardRosterMapper.ensureInitialized()
        .equalsValue(this as LeaderboardRoster, other);
  }

  @override
  int get hashCode {
    return LeaderboardRosterMapper.ensureInitialized()
        .hashValue(this as LeaderboardRoster);
  }
}

extension LeaderboardRosterValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LeaderboardRoster, $Out> {
  LeaderboardRosterCopyWith<$R, LeaderboardRoster, $Out>
      get $asLeaderboardRoster => $base
          .as((v, t, t2) => _LeaderboardRosterCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LeaderboardRosterCopyWith<$R, $In extends LeaderboardRoster,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? tankName,
      String? firstDamageName,
      String? secondDamageName,
      String? firstSupportName,
      String? secondSupportName,
      double? totalScore,
      String? seasonName});
  LeaderboardRosterCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LeaderboardRosterCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LeaderboardRoster, $Out>
    implements LeaderboardRosterCopyWith<$R, LeaderboardRoster, $Out> {
  _LeaderboardRosterCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LeaderboardRoster> $mapper =
      LeaderboardRosterMapper.ensureInitialized();
  @override
  $R call(
          {String? tankName,
          String? firstDamageName,
          String? secondDamageName,
          String? firstSupportName,
          String? secondSupportName,
          double? totalScore,
          String? seasonName}) =>
      $apply(FieldCopyWithData({
        if (tankName != null) #tankName: tankName,
        if (firstDamageName != null) #firstDamageName: firstDamageName,
        if (secondDamageName != null) #secondDamageName: secondDamageName,
        if (firstSupportName != null) #firstSupportName: firstSupportName,
        if (secondSupportName != null) #secondSupportName: secondSupportName,
        if (totalScore != null) #totalScore: totalScore,
        if (seasonName != null) #seasonName: seasonName
      }));
  @override
  LeaderboardRoster $make(CopyWithData data) => LeaderboardRoster(
      tankName: data.get(#tankName, or: $value.tankName),
      firstDamageName: data.get(#firstDamageName, or: $value.firstDamageName),
      secondDamageName:
          data.get(#secondDamageName, or: $value.secondDamageName),
      firstSupportName:
          data.get(#firstSupportName, or: $value.firstSupportName),
      secondSupportName:
          data.get(#secondSupportName, or: $value.secondSupportName),
      totalScore: data.get(#totalScore, or: $value.totalScore),
      seasonName: data.get(#seasonName, or: $value.seasonName));

  @override
  LeaderboardRosterCopyWith<$R2, LeaderboardRoster, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LeaderboardRosterCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
