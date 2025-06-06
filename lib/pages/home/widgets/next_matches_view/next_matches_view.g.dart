// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_matches_view.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nextMatchesHash() => r'8cacbe0989cc2481447ca98d8bb2f40fff3c4149';

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

/// See also [nextMatches].
@ProviderFor(nextMatches)
const nextMatchesProvider = NextMatchesFamily();

/// See also [nextMatches].
class NextMatchesFamily extends Family<AsyncValue<IList<Match>>> {
  /// See also [nextMatches].
  const NextMatchesFamily();

  /// See also [nextMatches].
  NextMatchesProvider call(Season season) {
    return NextMatchesProvider(season);
  }

  @override
  NextMatchesProvider getProviderOverride(
    covariant NextMatchesProvider provider,
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
  String? get name => r'nextMatchesProvider';
}

/// See also [nextMatches].
class NextMatchesProvider extends AutoDisposeFutureProvider<IList<Match>> {
  /// See also [nextMatches].
  NextMatchesProvider(Season season)
    : this._internal(
        (ref) => nextMatches(ref as NextMatchesRef, season),
        from: nextMatchesProvider,
        name: r'nextMatchesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$nextMatchesHash,
        dependencies: NextMatchesFamily._dependencies,
        allTransitiveDependencies: NextMatchesFamily._allTransitiveDependencies,
        season: season,
      );

  NextMatchesProvider._internal(
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
    FutureOr<IList<Match>> Function(NextMatchesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NextMatchesProvider._internal(
        (ref) => create(ref as NextMatchesRef),
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
  AutoDisposeFutureProviderElement<IList<Match>> createElement() {
    return _NextMatchesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NextMatchesProvider && other.season == season;
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
mixin NextMatchesRef on AutoDisposeFutureProviderRef<IList<Match>> {
  /// The parameter `season` of this provider.
  Season get season;
}

class _NextMatchesProviderElement
    extends AutoDisposeFutureProviderElement<IList<Match>>
    with NextMatchesRef {
  _NextMatchesProviderElement(super.provider);

  @override
  Season get season => (origin as NextMatchesProvider).season;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
