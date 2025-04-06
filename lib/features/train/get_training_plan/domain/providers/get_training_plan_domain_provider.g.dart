// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_training_plan_domain_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTrainingPlanDomainProviderAsyncHash() =>
    r'3cb15bde29a7462b6cc85ea6a3ed26542a060046';

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

abstract class _$GetTrainingPlanDomainProviderAsync
    extends BuildlessAutoDisposeAsyncNotifier<List<TrainingPlanClass>> {
  late final String id;

  FutureOr<List<TrainingPlanClass>> build({
    required String id,
  });
}

/// See also [GetTrainingPlanDomainProviderAsync].
@ProviderFor(GetTrainingPlanDomainProviderAsync)
const getTrainingPlanDomainProviderAsyncProvider =
    GetTrainingPlanDomainProviderAsyncFamily();

/// See also [GetTrainingPlanDomainProviderAsync].
class GetTrainingPlanDomainProviderAsyncFamily
    extends Family<AsyncValue<List<TrainingPlanClass>>> {
  /// See also [GetTrainingPlanDomainProviderAsync].
  const GetTrainingPlanDomainProviderAsyncFamily();

  /// See also [GetTrainingPlanDomainProviderAsync].
  GetTrainingPlanDomainProviderAsyncProvider call({
    required String id,
  }) {
    return GetTrainingPlanDomainProviderAsyncProvider(
      id: id,
    );
  }

  @override
  GetTrainingPlanDomainProviderAsyncProvider getProviderOverride(
    covariant GetTrainingPlanDomainProviderAsyncProvider provider,
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
  String? get name => r'getTrainingPlanDomainProviderAsyncProvider';
}

/// See also [GetTrainingPlanDomainProviderAsync].
class GetTrainingPlanDomainProviderAsyncProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        GetTrainingPlanDomainProviderAsync, List<TrainingPlanClass>> {
  /// See also [GetTrainingPlanDomainProviderAsync].
  GetTrainingPlanDomainProviderAsyncProvider({
    required String id,
  }) : this._internal(
          () => GetTrainingPlanDomainProviderAsync()..id = id,
          from: getTrainingPlanDomainProviderAsyncProvider,
          name: r'getTrainingPlanDomainProviderAsyncProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTrainingPlanDomainProviderAsyncHash,
          dependencies: GetTrainingPlanDomainProviderAsyncFamily._dependencies,
          allTransitiveDependencies: GetTrainingPlanDomainProviderAsyncFamily
              ._allTransitiveDependencies,
          id: id,
        );

  GetTrainingPlanDomainProviderAsyncProvider._internal(
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
    covariant GetTrainingPlanDomainProviderAsync notifier,
  ) {
    return notifier.build(
      id: id,
    );
  }

  @override
  Override overrideWith(GetTrainingPlanDomainProviderAsync Function() create) {
    return ProviderOverride(
      origin: this,
      override: GetTrainingPlanDomainProviderAsyncProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<GetTrainingPlanDomainProviderAsync,
      List<TrainingPlanClass>> createElement() {
    return _GetTrainingPlanDomainProviderAsyncProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTrainingPlanDomainProviderAsyncProvider &&
        other.id == id;
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
mixin GetTrainingPlanDomainProviderAsyncRef
    on AutoDisposeAsyncNotifierProviderRef<List<TrainingPlanClass>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetTrainingPlanDomainProviderAsyncProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        GetTrainingPlanDomainProviderAsync,
        List<TrainingPlanClass>> with GetTrainingPlanDomainProviderAsyncRef {
  _GetTrainingPlanDomainProviderAsyncProviderElement(super.provider);

  @override
  String get id => (origin as GetTrainingPlanDomainProviderAsyncProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
