// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$seasonHash() => r'd9db4f2fb9416e05242fd6b22e022da9df020041';

/// See also [season].
@ProviderFor(season)
final seasonProvider = AutoDisposeFutureProvider<IList<Season>>.internal(
  season,
  name: r'seasonProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$seasonHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SeasonRef = AutoDisposeFutureProviderRef<IList<Season>>;
String _$selectedSeasonHash() => r'09a078cdceb6523493f19eb8c31cc25f5058e6cc';

/// See also [SelectedSeason].
@ProviderFor(SelectedSeason)
final selectedSeasonProvider =
    AutoDisposeNotifierProvider<SelectedSeason, Season>.internal(
      SelectedSeason.new,
      name: r'selectedSeasonProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$selectedSeasonHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedSeason = AutoDisposeNotifier<Season>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
