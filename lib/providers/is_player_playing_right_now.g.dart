// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_player_playing_right_now.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isPlayerPlayingRightNowHash() =>
    r'5b2598f324a726a7f69c2cecf04df08bfdbed295';

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

/// See also [isPlayerPlayingRightNow].
@ProviderFor(isPlayerPlayingRightNow)
const isPlayerPlayingRightNowProvider = IsPlayerPlayingRightNowFamily();

/// See also [isPlayerPlayingRightNow].
class IsPlayerPlayingRightNowFamily extends Family<bool> {
  /// See also [isPlayerPlayingRightNow].
  const IsPlayerPlayingRightNowFamily();

  /// See also [isPlayerPlayingRightNow].
  IsPlayerPlayingRightNowProvider call(Player player, IList<Match> matches) {
    return IsPlayerPlayingRightNowProvider(player, matches);
  }

  @override
  IsPlayerPlayingRightNowProvider getProviderOverride(
    covariant IsPlayerPlayingRightNowProvider provider,
  ) {
    return call(provider.player, provider.matches);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isPlayerPlayingRightNowProvider';
}

/// See also [isPlayerPlayingRightNow].
class IsPlayerPlayingRightNowProvider extends AutoDisposeProvider<bool> {
  /// See also [isPlayerPlayingRightNow].
  IsPlayerPlayingRightNowProvider(Player player, IList<Match> matches)
    : this._internal(
        (ref) => isPlayerPlayingRightNow(
          ref as IsPlayerPlayingRightNowRef,
          player,
          matches,
        ),
        from: isPlayerPlayingRightNowProvider,
        name: r'isPlayerPlayingRightNowProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$isPlayerPlayingRightNowHash,
        dependencies: IsPlayerPlayingRightNowFamily._dependencies,
        allTransitiveDependencies:
            IsPlayerPlayingRightNowFamily._allTransitiveDependencies,
        player: player,
        matches: matches,
      );

  IsPlayerPlayingRightNowProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.player,
    required this.matches,
  }) : super.internal();

  final Player player;
  final IList<Match> matches;

  @override
  Override overrideWith(
    bool Function(IsPlayerPlayingRightNowRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsPlayerPlayingRightNowProvider._internal(
        (ref) => create(ref as IsPlayerPlayingRightNowRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        player: player,
        matches: matches,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _IsPlayerPlayingRightNowProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsPlayerPlayingRightNowProvider &&
        other.player == player &&
        other.matches == matches;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, player.hashCode);
    hash = _SystemHash.combine(hash, matches.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IsPlayerPlayingRightNowRef on AutoDisposeProviderRef<bool> {
  /// The parameter `player` of this provider.
  Player get player;

  /// The parameter `matches` of this provider.
  IList<Match> get matches;
}

class _IsPlayerPlayingRightNowProviderElement
    extends AutoDisposeProviderElement<bool>
    with IsPlayerPlayingRightNowRef {
  _IsPlayerPlayingRightNowProviderElement(super.provider);

  @override
  Player get player => (origin as IsPlayerPlayingRightNowProvider).player;
  @override
  IList<Match> get matches =>
      (origin as IsPlayerPlayingRightNowProvider).matches;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
