// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_players_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bestPlayersHash() => r'6451877b47737c7e97e94224e3183498579f0721';

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

/// See also [bestPlayers].
@ProviderFor(bestPlayers)
const bestPlayersProvider = BestPlayersFamily();

/// See also [bestPlayers].
class BestPlayersFamily extends Family<AsyncValue<List<Player>>> {
  /// See also [bestPlayers].
  const BestPlayersFamily();

  /// See also [bestPlayers].
  BestPlayersProvider call(Season season) {
    return BestPlayersProvider(season);
  }

  @override
  BestPlayersProvider getProviderOverride(
    covariant BestPlayersProvider provider,
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
  String? get name => r'bestPlayersProvider';
}

/// See also [bestPlayers].
class BestPlayersProvider extends AutoDisposeFutureProvider<List<Player>> {
  /// See also [bestPlayers].
  BestPlayersProvider(Season season)
    : this._internal(
        (ref) => bestPlayers(ref as BestPlayersRef, season),
        from: bestPlayersProvider,
        name: r'bestPlayersProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$bestPlayersHash,
        dependencies: BestPlayersFamily._dependencies,
        allTransitiveDependencies: BestPlayersFamily._allTransitiveDependencies,
        season: season,
      );

  BestPlayersProvider._internal(
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
  Override overrideWith(
    FutureOr<List<Player>> Function(BestPlayersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BestPlayersProvider._internal(
        (ref) => create(ref as BestPlayersRef),
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
  AutoDisposeFutureProviderElement<List<Player>> createElement() {
    return _BestPlayersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BestPlayersProvider && other.season == season;
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
mixin BestPlayersRef on AutoDisposeFutureProviderRef<List<Player>> {
  /// The parameter `season` of this provider.
  Season get season;
}

class _BestPlayersProviderElement
    extends AutoDisposeFutureProviderElement<List<Player>>
    with BestPlayersRef {
  _BestPlayersProviderElement(super.provider);

  @override
  Season get season => (origin as BestPlayersProvider).season;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
