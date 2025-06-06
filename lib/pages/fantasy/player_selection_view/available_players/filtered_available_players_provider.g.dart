// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_available_players_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredAvailablePlayersHash() =>
    r'f2cb111fcb1c68372838aa1b95e81ca0d6de706c';

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

/// See also [filteredAvailablePlayers].
@ProviderFor(filteredAvailablePlayers)
const filteredAvailablePlayersProvider = FilteredAvailablePlayersFamily();

/// See also [filteredAvailablePlayers].
class FilteredAvailablePlayersFamily extends Family<AsyncValue<IList<Player>>> {
  /// See also [filteredAvailablePlayers].
  const FilteredAvailablePlayersFamily();

  /// See also [filteredAvailablePlayers].
  FilteredAvailablePlayersProvider call({
    required Season season,
    required PlayerSelectionFilter? filter,
    required PlayerSorting sorting,
    required int maxCost,
    required String searchQuery,
  }) {
    return FilteredAvailablePlayersProvider(
      season: season,
      filter: filter,
      sorting: sorting,
      maxCost: maxCost,
      searchQuery: searchQuery,
    );
  }

  @override
  FilteredAvailablePlayersProvider getProviderOverride(
    covariant FilteredAvailablePlayersProvider provider,
  ) {
    return call(
      season: provider.season,
      filter: provider.filter,
      sorting: provider.sorting,
      maxCost: provider.maxCost,
      searchQuery: provider.searchQuery,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'filteredAvailablePlayersProvider';
}

/// See also [filteredAvailablePlayers].
class FilteredAvailablePlayersProvider
    extends AutoDisposeFutureProvider<IList<Player>> {
  /// See also [filteredAvailablePlayers].
  FilteredAvailablePlayersProvider({
    required Season season,
    required PlayerSelectionFilter? filter,
    required PlayerSorting sorting,
    required int maxCost,
    required String searchQuery,
  }) : this._internal(
         (ref) => filteredAvailablePlayers(
           ref as FilteredAvailablePlayersRef,
           season: season,
           filter: filter,
           sorting: sorting,
           maxCost: maxCost,
           searchQuery: searchQuery,
         ),
         from: filteredAvailablePlayersProvider,
         name: r'filteredAvailablePlayersProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$filteredAvailablePlayersHash,
         dependencies: FilteredAvailablePlayersFamily._dependencies,
         allTransitiveDependencies:
             FilteredAvailablePlayersFamily._allTransitiveDependencies,
         season: season,
         filter: filter,
         sorting: sorting,
         maxCost: maxCost,
         searchQuery: searchQuery,
       );

  FilteredAvailablePlayersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.season,
    required this.filter,
    required this.sorting,
    required this.maxCost,
    required this.searchQuery,
  }) : super.internal();

  final Season season;
  final PlayerSelectionFilter? filter;
  final PlayerSorting sorting;
  final int maxCost;
  final String searchQuery;

  @override
  Override overrideWith(
    FutureOr<IList<Player>> Function(FilteredAvailablePlayersRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredAvailablePlayersProvider._internal(
        (ref) => create(ref as FilteredAvailablePlayersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        season: season,
        filter: filter,
        sorting: sorting,
        maxCost: maxCost,
        searchQuery: searchQuery,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<IList<Player>> createElement() {
    return _FilteredAvailablePlayersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredAvailablePlayersProvider &&
        other.season == season &&
        other.filter == filter &&
        other.sorting == sorting &&
        other.maxCost == maxCost &&
        other.searchQuery == searchQuery;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, season.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);
    hash = _SystemHash.combine(hash, sorting.hashCode);
    hash = _SystemHash.combine(hash, maxCost.hashCode);
    hash = _SystemHash.combine(hash, searchQuery.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FilteredAvailablePlayersRef
    on AutoDisposeFutureProviderRef<IList<Player>> {
  /// The parameter `season` of this provider.
  Season get season;

  /// The parameter `filter` of this provider.
  PlayerSelectionFilter? get filter;

  /// The parameter `sorting` of this provider.
  PlayerSorting get sorting;

  /// The parameter `maxCost` of this provider.
  int get maxCost;

  /// The parameter `searchQuery` of this provider.
  String get searchQuery;
}

class _FilteredAvailablePlayersProviderElement
    extends AutoDisposeFutureProviderElement<IList<Player>>
    with FilteredAvailablePlayersRef {
  _FilteredAvailablePlayersProviderElement(super.provider);

  @override
  Season get season => (origin as FilteredAvailablePlayersProvider).season;
  @override
  PlayerSelectionFilter? get filter =>
      (origin as FilteredAvailablePlayersProvider).filter;
  @override
  PlayerSorting get sorting =>
      (origin as FilteredAvailablePlayersProvider).sorting;
  @override
  int get maxCost => (origin as FilteredAvailablePlayersProvider).maxCost;
  @override
  String get searchQuery =>
      (origin as FilteredAvailablePlayersProvider).searchQuery;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
