// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_roster_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRosterExistsHash() => r'30c3ffddd85bb392095ea6deb1a3e824560f940a';

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

abstract class _$UserRosterExists extends BuildlessAutoDisposeNotifier<bool> {
  late final SeasonId seasonId;

  bool build(SeasonId seasonId);
}

/// See also [UserRosterExists].
@ProviderFor(UserRosterExists)
const userRosterExistsProvider = UserRosterExistsFamily();

/// See also [UserRosterExists].
class UserRosterExistsFamily extends Family<bool> {
  /// See also [UserRosterExists].
  const UserRosterExistsFamily();

  /// See also [UserRosterExists].
  UserRosterExistsProvider call(SeasonId seasonId) {
    return UserRosterExistsProvider(seasonId);
  }

  @override
  UserRosterExistsProvider getProviderOverride(
    covariant UserRosterExistsProvider provider,
  ) {
    return call(provider.seasonId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userRosterExistsProvider';
}

/// See also [UserRosterExists].
class UserRosterExistsProvider
    extends AutoDisposeNotifierProviderImpl<UserRosterExists, bool> {
  /// See also [UserRosterExists].
  UserRosterExistsProvider(SeasonId seasonId)
    : this._internal(
        () => UserRosterExists()..seasonId = seasonId,
        from: userRosterExistsProvider,
        name: r'userRosterExistsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$userRosterExistsHash,
        dependencies: UserRosterExistsFamily._dependencies,
        allTransitiveDependencies:
            UserRosterExistsFamily._allTransitiveDependencies,
        seasonId: seasonId,
      );

  UserRosterExistsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seasonId,
  }) : super.internal();

  final SeasonId seasonId;

  @override
  bool runNotifierBuild(covariant UserRosterExists notifier) {
    return notifier.build(seasonId);
  }

  @override
  Override overrideWith(UserRosterExists Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserRosterExistsProvider._internal(
        () => create()..seasonId = seasonId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seasonId: seasonId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<UserRosterExists, bool> createElement() {
    return _UserRosterExistsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserRosterExistsProvider && other.seasonId == seasonId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seasonId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserRosterExistsRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `seasonId` of this provider.
  SeasonId get seasonId;
}

class _UserRosterExistsProviderElement
    extends AutoDisposeNotifierProviderElement<UserRosterExists, bool>
    with UserRosterExistsRef {
  _UserRosterExistsProviderElement(super.provider);

  @override
  SeasonId get seasonId => (origin as UserRosterExistsProvider).seasonId;
}

String _$userRosterHash() => r'0e67bc96eef974639b495edfe3a5aeb27645af7e';

abstract class _$UserRoster extends BuildlessAutoDisposeAsyncNotifier<Roster> {
  late final SeasonId seasonId;

  FutureOr<Roster> build(SeasonId seasonId);
}

/// See also [UserRoster].
@ProviderFor(UserRoster)
const userRosterProvider = UserRosterFamily();

/// See also [UserRoster].
class UserRosterFamily extends Family<AsyncValue<Roster>> {
  /// See also [UserRoster].
  const UserRosterFamily();

  /// See also [UserRoster].
  UserRosterProvider call(SeasonId seasonId) {
    return UserRosterProvider(seasonId);
  }

  @override
  UserRosterProvider getProviderOverride(
    covariant UserRosterProvider provider,
  ) {
    return call(provider.seasonId);
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
  UserRosterProvider(SeasonId seasonId)
    : this._internal(
        () => UserRoster()..seasonId = seasonId,
        from: userRosterProvider,
        name: r'userRosterProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$userRosterHash,
        dependencies: UserRosterFamily._dependencies,
        allTransitiveDependencies: UserRosterFamily._allTransitiveDependencies,
        seasonId: seasonId,
      );

  UserRosterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seasonId,
  }) : super.internal();

  final SeasonId seasonId;

  @override
  FutureOr<Roster> runNotifierBuild(covariant UserRoster notifier) {
    return notifier.build(seasonId);
  }

  @override
  Override overrideWith(UserRoster Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserRosterProvider._internal(
        () => create()..seasonId = seasonId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seasonId: seasonId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserRoster, Roster> createElement() {
    return _UserRosterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserRosterProvider && other.seasonId == seasonId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seasonId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserRosterRef on AutoDisposeAsyncNotifierProviderRef<Roster> {
  /// The parameter `seasonId` of this provider.
  SeasonId get seasonId;
}

class _UserRosterProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserRoster, Roster>
    with UserRosterRef {
  _UserRosterProviderElement(super.provider);

  @override
  SeasonId get seasonId => (origin as UserRosterProvider).seasonId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
