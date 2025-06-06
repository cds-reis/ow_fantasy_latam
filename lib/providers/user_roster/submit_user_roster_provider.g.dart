// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_user_roster_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$submitUserRosterHash() => r'6bb8f531d21c95c6edddcd9d7d76e88740e9d4ee';

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

/// See also [submitUserRoster].
@ProviderFor(submitUserRoster)
const submitUserRosterProvider = SubmitUserRosterFamily();

/// See also [submitUserRoster].
class SubmitUserRosterFamily extends Family<AsyncValue<void>> {
  /// See also [submitUserRoster].
  const SubmitUserRosterFamily();

  /// See also [submitUserRoster].
  SubmitUserRosterProvider call(Roster roster) {
    return SubmitUserRosterProvider(roster);
  }

  @override
  SubmitUserRosterProvider getProviderOverride(
    covariant SubmitUserRosterProvider provider,
  ) {
    return call(provider.roster);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'submitUserRosterProvider';
}

/// See also [submitUserRoster].
class SubmitUserRosterProvider extends AutoDisposeFutureProvider<void> {
  /// See also [submitUserRoster].
  SubmitUserRosterProvider(Roster roster)
    : this._internal(
        (ref) => submitUserRoster(ref as SubmitUserRosterRef, roster),
        from: submitUserRosterProvider,
        name: r'submitUserRosterProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$submitUserRosterHash,
        dependencies: SubmitUserRosterFamily._dependencies,
        allTransitiveDependencies:
            SubmitUserRosterFamily._allTransitiveDependencies,
        roster: roster,
      );

  SubmitUserRosterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roster,
  }) : super.internal();

  final Roster roster;

  @override
  Override overrideWith(
    FutureOr<void> Function(SubmitUserRosterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmitUserRosterProvider._internal(
        (ref) => create(ref as SubmitUserRosterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roster: roster,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SubmitUserRosterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmitUserRosterProvider && other.roster == roster;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roster.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SubmitUserRosterRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `roster` of this provider.
  Roster get roster;
}

class _SubmitUserRosterProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with SubmitUserRosterRef {
  _SubmitUserRosterProviderElement(super.provider);

  @override
  Roster get roster => (origin as SubmitUserRosterProvider).roster;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
