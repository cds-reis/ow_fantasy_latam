// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_transfers_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userTransfersHash() => r'6c87b84a1ca523c11761733fbfa99c77b7c6fe71';

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

/// See also [userTransfers].
@ProviderFor(userTransfers)
const userTransfersProvider = UserTransfersFamily();

/// See also [userTransfers].
class UserTransfersFamily extends Family<AsyncValue<TransfersAmount>> {
  /// See also [userTransfers].
  const UserTransfersFamily();

  /// See also [userTransfers].
  UserTransfersProvider call(SeasonId seasonId) {
    return UserTransfersProvider(seasonId);
  }

  @override
  UserTransfersProvider getProviderOverride(
    covariant UserTransfersProvider provider,
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
  String? get name => r'userTransfersProvider';
}

/// See also [userTransfers].
class UserTransfersProvider extends AutoDisposeFutureProvider<TransfersAmount> {
  /// See also [userTransfers].
  UserTransfersProvider(SeasonId seasonId)
    : this._internal(
        (ref) => userTransfers(ref as UserTransfersRef, seasonId),
        from: userTransfersProvider,
        name: r'userTransfersProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$userTransfersHash,
        dependencies: UserTransfersFamily._dependencies,
        allTransitiveDependencies:
            UserTransfersFamily._allTransitiveDependencies,
        seasonId: seasonId,
      );

  UserTransfersProvider._internal(
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
  Override overrideWith(
    FutureOr<TransfersAmount> Function(UserTransfersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserTransfersProvider._internal(
        (ref) => create(ref as UserTransfersRef),
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
  AutoDisposeFutureProviderElement<TransfersAmount> createElement() {
    return _UserTransfersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserTransfersProvider && other.seasonId == seasonId;
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
mixin UserTransfersRef on AutoDisposeFutureProviderRef<TransfersAmount> {
  /// The parameter `seasonId` of this provider.
  SeasonId get seasonId;
}

class _UserTransfersProviderElement
    extends AutoDisposeFutureProviderElement<TransfersAmount>
    with UserTransfersRef {
  _UserTransfersProviderElement(super.provider);

  @override
  SeasonId get seasonId => (origin as UserTransfersProvider).seasonId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
