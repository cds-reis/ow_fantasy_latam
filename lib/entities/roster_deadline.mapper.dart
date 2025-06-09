// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'roster_deadline.dart';

class RosterDeadlineMapper extends ClassMapperBase<RosterDeadline> {
  RosterDeadlineMapper._();

  static RosterDeadlineMapper? _instance;
  static RosterDeadlineMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RosterDeadlineMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RosterDeadline';

  static DateTime _$deadline(RosterDeadline v) => v.deadline;
  static const Field<RosterDeadline, DateTime> _f$deadline =
      Field('deadline', _$deadline);
  static DateTime _$now(RosterDeadline v) => v.now;
  static const Field<RosterDeadline, DateTime> _f$now = Field('now', _$now);
  static bool _$isPastDeadline(RosterDeadline v) => v.isPastDeadline;
  static const Field<RosterDeadline, bool> _f$isPastDeadline =
      Field('isPastDeadline', _$isPastDeadline, key: r'is_past_deadline');

  @override
  final MappableFields<RosterDeadline> fields = const {
    #deadline: _f$deadline,
    #now: _f$now,
    #isPastDeadline: _f$isPastDeadline,
  };

  static RosterDeadline _instantiate(DecodingData data) {
    return RosterDeadline(
        deadline: data.dec(_f$deadline),
        now: data.dec(_f$now),
        isPastDeadline: data.dec(_f$isPastDeadline));
  }

  @override
  final Function instantiate = _instantiate;

  static RosterDeadline fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RosterDeadline>(map);
  }

  static RosterDeadline fromJson(String json) {
    return ensureInitialized().decodeJson<RosterDeadline>(json);
  }
}

mixin RosterDeadlineMappable {
  String toJson() {
    return RosterDeadlineMapper.ensureInitialized()
        .encodeJson<RosterDeadline>(this as RosterDeadline);
  }

  Map<String, dynamic> toMap() {
    return RosterDeadlineMapper.ensureInitialized()
        .encodeMap<RosterDeadline>(this as RosterDeadline);
  }

  RosterDeadlineCopyWith<RosterDeadline, RosterDeadline, RosterDeadline>
      get copyWith =>
          _RosterDeadlineCopyWithImpl<RosterDeadline, RosterDeadline>(
              this as RosterDeadline, $identity, $identity);
  @override
  String toString() {
    return RosterDeadlineMapper.ensureInitialized()
        .stringifyValue(this as RosterDeadline);
  }

  @override
  bool operator ==(Object other) {
    return RosterDeadlineMapper.ensureInitialized()
        .equalsValue(this as RosterDeadline, other);
  }

  @override
  int get hashCode {
    return RosterDeadlineMapper.ensureInitialized()
        .hashValue(this as RosterDeadline);
  }
}

extension RosterDeadlineValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RosterDeadline, $Out> {
  RosterDeadlineCopyWith<$R, RosterDeadline, $Out> get $asRosterDeadline =>
      $base.as((v, t, t2) => _RosterDeadlineCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RosterDeadlineCopyWith<$R, $In extends RosterDeadline, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({DateTime? deadline, DateTime? now, bool? isPastDeadline});
  RosterDeadlineCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _RosterDeadlineCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RosterDeadline, $Out>
    implements RosterDeadlineCopyWith<$R, RosterDeadline, $Out> {
  _RosterDeadlineCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RosterDeadline> $mapper =
      RosterDeadlineMapper.ensureInitialized();
  @override
  $R call({DateTime? deadline, DateTime? now, bool? isPastDeadline}) =>
      $apply(FieldCopyWithData({
        if (deadline != null) #deadline: deadline,
        if (now != null) #now: now,
        if (isPastDeadline != null) #isPastDeadline: isPastDeadline
      }));
  @override
  RosterDeadline $make(CopyWithData data) => RosterDeadline(
      deadline: data.get(#deadline, or: $value.deadline),
      now: data.get(#now, or: $value.now),
      isPastDeadline: data.get(#isPastDeadline, or: $value.isPastDeadline));

  @override
  RosterDeadlineCopyWith<$R2, RosterDeadline, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RosterDeadlineCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
