// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leaderboardHash() => r'b95770add87af5074fac1ce47751f7823f1c8aa3';

/// See also [Leaderboard].
@ProviderFor(Leaderboard)
final leaderboardProvider =
    AutoDisposeAsyncNotifierProvider<
      Leaderboard,
      List<LeaderboardEntry>
    >.internal(
      Leaderboard.new,
      name: r'leaderboardProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$leaderboardHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Leaderboard = AutoDisposeAsyncNotifier<List<LeaderboardEntry>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
