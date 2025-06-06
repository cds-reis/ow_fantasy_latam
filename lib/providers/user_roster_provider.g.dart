// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_roster_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRosterExistsHash() => r'aade2dc519e65d4fffb6534e65d3d8bfc56d15a9';

/// See also [UserRosterExists].
@ProviderFor(UserRosterExists)
final userRosterExistsProvider =
    AutoDisposeNotifierProvider<UserRosterExists, bool>.internal(
      UserRosterExists.new,
      name: r'userRosterExistsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userRosterExistsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UserRosterExists = AutoDisposeNotifier<bool>;
String _$userRosterHash() => r'e36ed1d2481544fda336c9b6c7122260cb5069e2';

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

abstract class _$UserRoster extends BuildlessAutoDisposeAsyncNotifier<Roster> {
  late final Season season;

  FutureOr<Roster> build(Season season);
}

/// See also [UserRoster].
@ProviderFor(UserRoster)
const userRosterProvider = UserRosterFamily();

/// See also [UserRoster].
class UserRosterFamily extends Family<AsyncValue<Roster>> {
  /// See also [UserRoster].
  const UserRosterFamily();

  /// See also [UserRoster].
  UserRosterProvider call(Season season) {
    return UserRosterProvider(season);
  }

  @override
  UserRosterProvider getProviderOverride(
    covariant UserRosterProvider provider,
  ) {
    return call(provider.season);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userRosterProvider';
}

/// See also [UserRoster].
class UserRosterProvider
    extends AutoDisposeAsyncNotifierProviderImpl<UserRoster, Roster> {
  /// See also [UserRoster].
  UserRosterProvider(Season season)
    : this._internal(
        () => UserRoster()..season = season,
        from: userRosterProvider,
        name: r'userRosterProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$userRosterHash,
        dependencies: UserRosterFamily._dependencies,
        allTransitiveDependencies: UserRosterFamily._allTransitiveDependencies,
        season: season,
      );

  UserRosterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.season,
  }) : super.internal();

  final Season season;

  @override
  FutureOr<Roster> runNotifierBuild(covariant UserRoster notifier) {
    return notifier.build(season);
  }

  @override
  Override overrideWith(UserRoster Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserRosterProvider._internal(
        () => create()..season = season,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        season: season,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserRoster, Roster> createElement() {
    return _UserRosterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserRosterProvider && other.season == season;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, season.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserRosterRef on AutoDisposeAsyncNotifierProviderRef<Roster> {
  /// The parameter `season` of this provider.
  Season get season;
}

class _UserRosterProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserRoster, Roster>
    with UserRosterRef {
  _UserRosterProviderElement(super.provider);

  @override
  Season get season => (origin as UserRosterProvider).season;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
