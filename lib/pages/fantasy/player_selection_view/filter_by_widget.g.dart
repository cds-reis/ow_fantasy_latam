// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_by_widget.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$availableFiltersHash() => r'3d080beef0820486bca884d38eb832db4abca836';

/// See also [availableFilters].
@ProviderFor(availableFilters)
final availableFiltersProvider =
    AutoDisposeFutureProvider<IList<PlayerSelectionFilter>>.internal(
      availableFilters,
      name: r'availableFiltersProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$availableFiltersHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AvailableFiltersRef =
    AutoDisposeFutureProviderRef<IList<PlayerSelectionFilter>>;
String _$filterByHash() => r'bbfbfab14d2aa2405e317abfde612bd4820a7e69';

/// See also [FilterBy].
@ProviderFor(FilterBy)
final filterByProvider =
    AutoDisposeNotifierProvider<FilterBy, PlayerSelectionFilter?>.internal(
      FilterBy.new,
      name: r'filterByProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$filterByHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FilterBy = AutoDisposeNotifier<PlayerSelectionFilter?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
