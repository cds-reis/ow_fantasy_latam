// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_submition_status_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerSubmitionStatusHash() =>
    r'5b28862a4c22c8144cbba224da87b569b636bfca';

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

/// See also [playerSubmitionStatus].
@ProviderFor(playerSubmitionStatus)
const playerSubmitionStatusProvider = PlayerSubmitionStatusFamily();

/// See also [playerSubmitionStatus].
class PlayerSubmitionStatusFamily
    extends Family<AsyncValue<PlayerSubmitionStatus>> {
  /// See also [playerSubmitionStatus].
  const PlayerSubmitionStatusFamily();

  /// See also [playerSubmitionStatus].
  PlayerSubmitionStatusProvider call(PlayerSubmitionRequest request) {
    return PlayerSubmitionStatusProvider(request);
  }

  @override
  PlayerSubmitionStatusProvider getProviderOverride(
    covariant PlayerSubmitionStatusProvider provider,
  ) {
    return call(provider.request);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'playerSubmitionStatusProvider';
}

/// See also [playerSubmitionStatus].
class PlayerSubmitionStatusProvider
    extends AutoDisposeFutureProvider<PlayerSubmitionStatus> {
  /// See also [playerSubmitionStatus].
  PlayerSubmitionStatusProvider(PlayerSubmitionRequest request)
    : this._internal(
        (ref) =>
            playerSubmitionStatus(ref as PlayerSubmitionStatusRef, request),
        from: playerSubmitionStatusProvider,
        name: r'playerSubmitionStatusProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$playerSubmitionStatusHash,
        dependencies: PlayerSubmitionStatusFamily._dependencies,
        allTransitiveDependencies:
            PlayerSubmitionStatusFamily._allTransitiveDependencies,
        request: request,
      );

  PlayerSubmitionStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.request,
  }) : super.internal();

  final PlayerSubmitionRequest request;

  @override
  Override overrideWith(
    FutureOr<PlayerSubmitionStatus> Function(PlayerSubmitionStatusRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlayerSubmitionStatusProvider._internal(
        (ref) => create(ref as PlayerSubmitionStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        request: request,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PlayerSubmitionStatus> createElement() {
    return _PlayerSubmitionStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerSubmitionStatusProvider && other.request == request;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, request.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PlayerSubmitionStatusRef
    on AutoDisposeFutureProviderRef<PlayerSubmitionStatus> {
  /// The parameter `request` of this provider.
  PlayerSubmitionRequest get request;
}

class _PlayerSubmitionStatusProviderElement
    extends AutoDisposeFutureProviderElement<PlayerSubmitionStatus>
    with PlayerSubmitionStatusRef {
  _PlayerSubmitionStatusProviderElement(super.provider);

  @override
  PlayerSubmitionRequest get request =>
      (origin as PlayerSubmitionStatusProvider).request;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
