// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_for_team_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$matchesForTeamHash() => r'6d584adc769cf444b22ff292ac8c1b052d10b25b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [matchesForTeam].
@ProviderFor(matchesForTeam)
const matchesForTeamProvider = MatchesForTeamFamily();

/// See also [matchesForTeam].
class MatchesForTeamFamily extends Family<AsyncValue<IList<Match>>> {
  /// See also [matchesForTeam].
  const MatchesForTeamFamily();

  /// See also [matchesForTeam].
  MatchesForTeamProvider call(Team team) {
    return MatchesForTeamProvider(team);
  }

  @override
  MatchesForTeamProvider getProviderOverride(
    covariant MatchesForTeamProvider provider,
  ) {
    return call(provider.team);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'matchesForTeamProvider';
}

/// See also [matchesForTeam].
class MatchesForTeamProvider extends AutoDisposeFutureProvider<IList<Match>> {
  /// See also [matchesForTeam].
  MatchesForTeamProvider(Team team)
    : this._internal(
        (ref) => matchesForTeam(ref as MatchesForTeamRef, team),
        from: matchesForTeamProvider,
        name: r'matchesForTeamProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$matchesForTeamHash,
        dependencies: MatchesForTeamFamily._dependencies,
        allTransitiveDependencies:
            MatchesForTeamFamily._allTransitiveDependencies,
        team: team,
      );

  MatchesForTeamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.team,
  }) : super.internal();

  final Team team;

  @override
  Override overrideWith(
    FutureOr<IList<Match>> Function(MatchesForTeamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MatchesForTeamProvider._internal(
        (ref) => create(ref as MatchesForTeamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        team: team,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<IList<Match>> createElement() {
    return _MatchesForTeamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MatchesForTeamProvider && other.team == team;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, team.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MatchesForTeamRef on AutoDisposeFutureProviderRef<IList<Match>> {
  /// The parameter `team` of this provider.
  Team get team;
}

class _MatchesForTeamProviderElement
    extends AutoDisposeFutureProviderElement<IList<Match>>
    with MatchesForTeamRef {
  _MatchesForTeamProviderElement(super.provider);

  @override
  Team get team => (origin as MatchesForTeamProvider).team;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
