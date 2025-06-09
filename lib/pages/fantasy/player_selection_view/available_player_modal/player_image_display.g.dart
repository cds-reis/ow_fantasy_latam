// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_image_display.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerImageHash() => r'8b433c3a72fa8ff3cec345c20a8d3c0fdf1631d1';

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

/// See also [playerImage].
@ProviderFor(playerImage)
const playerImageProvider = PlayerImageFamily();

/// See also [playerImage].
class PlayerImageFamily extends Family<AsyncValue<PlayerImage>> {
  /// See also [playerImage].
  const PlayerImageFamily();

  /// See also [playerImage].
  PlayerImageProvider call(Player player) {
    return PlayerImageProvider(player);
  }

  @override
  PlayerImageProvider getProviderOverride(
    covariant PlayerImageProvider provider,
  ) {
    return call(provider.player);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'playerImageProvider';
}

/// See also [playerImage].
class PlayerImageProvider extends AutoDisposeFutureProvider<PlayerImage> {
  /// See also [playerImage].
  PlayerImageProvider(Player player)
    : this._internal(
        (ref) => playerImage(ref as PlayerImageRef, player),
        from: playerImageProvider,
        name: r'playerImageProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$playerImageHash,
        dependencies: PlayerImageFamily._dependencies,
        allTransitiveDependencies: PlayerImageFamily._allTransitiveDependencies,
        player: player,
      );

  PlayerImageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.player,
  }) : super.internal();

  final Player player;

  @override
  Override overrideWith(
    FutureOr<PlayerImage> Function(PlayerImageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlayerImageProvider._internal(
        (ref) => create(ref as PlayerImageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        player: player,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PlayerImage> createElement() {
    return _PlayerImageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerImageProvider && other.player == player;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, player.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PlayerImageRef on AutoDisposeFutureProviderRef<PlayerImage> {
  /// The parameter `player` of this provider.
  Player get player;
}

class _PlayerImageProviderElement
    extends AutoDisposeFutureProviderElement<PlayerImage>
    with PlayerImageRef {
  _PlayerImageProviderElement(super.provider);

  @override
  Player get player => (origin as PlayerImageProvider).player;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
