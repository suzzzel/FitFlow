// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_plan_domain_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$trainingPlanDomainProviderAsyncHash() =>
    r'bf78111920b9594909a138a7dfceb11694eb912c';

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

abstract class _$TrainingPlanDomainProviderAsync
    extends BuildlessAutoDisposeAsyncNotifier<List<TrainingPlanClass>> {
  late final String id;

  FutureOr<List<TrainingPlanClass>> build({
    required String id,
  });
}

/// See also [TrainingPlanDomainProviderAsync].
@ProviderFor(TrainingPlanDomainProviderAsync)
const trainingPlanDomainProviderAsyncProvider =
    TrainingPlanDomainProviderAsyncFamily();

/// See also [TrainingPlanDomainProviderAsync].
class TrainingPlanDomainProviderAsyncFamily
    extends Family<AsyncValue<List<TrainingPlanClass>>> {
  /// See also [TrainingPlanDomainProviderAsync].
  const TrainingPlanDomainProviderAsyncFamily();

  /// See also [TrainingPlanDomainProviderAsync].
  TrainingPlanDomainProviderAsyncProvider call({
    required String id,
  }) {
    return TrainingPlanDomainProviderAsyncProvider(
      id: id,
    );
  }

  @override
  TrainingPlanDomainProviderAsyncProvider getProviderOverride(
    covariant TrainingPlanDomainProviderAsyncProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'trainingPlanDomainProviderAsyncProvider';
}

/// See also [TrainingPlanDomainProviderAsync].
class TrainingPlanDomainProviderAsyncProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        TrainingPlanDomainProviderAsync, List<TrainingPlanClass>> {
  /// See also [TrainingPlanDomainProviderAsync].
  TrainingPlanDomainProviderAsyncProvider({
    required String id,
  }) : this._internal(
          () => TrainingPlanDomainProviderAsync()..id = id,
          from: trainingPlanDomainProviderAsyncProvider,
          name: r'trainingPlanDomainProviderAsyncProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$trainingPlanDomainProviderAsyncHash,
          dependencies: TrainingPlanDomainProviderAsyncFamily._dependencies,
          allTransitiveDependencies:
              TrainingPlanDomainProviderAsyncFamily._allTransitiveDependencies,
          id: id,
        );

  TrainingPlanDomainProviderAsyncProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<List<TrainingPlanClass>> runNotifierBuild(
    covariant TrainingPlanDomainProviderAsync notifier,
  ) {
    return notifier.build(
      id: id,
    );
  }

  @override
  Override overrideWith(TrainingPlanDomainProviderAsync Function() create) {
    return ProviderOverride(
      origin: this,
      override: TrainingPlanDomainProviderAsyncProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TrainingPlanDomainProviderAsync,
      List<TrainingPlanClass>> createElement() {
    return _TrainingPlanDomainProviderAsyncProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TrainingPlanDomainProviderAsyncProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TrainingPlanDomainProviderAsyncRef
    on AutoDisposeAsyncNotifierProviderRef<List<TrainingPlanClass>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _TrainingPlanDomainProviderAsyncProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        TrainingPlanDomainProviderAsync,
        List<TrainingPlanClass>> with TrainingPlanDomainProviderAsyncRef {
  _TrainingPlanDomainProviderAsyncProviderElement(super.provider);

  @override
  String get id => (origin as TrainingPlanDomainProviderAsyncProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
