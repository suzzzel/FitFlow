import 'package:fitflow/features/train/data/providers/training_plan_data_provider.dart';
import 'package:fitflow/features/train/domain/models/training_plan_class.dart';
import 'package:fitflow/features/train/domain/repo/training_plan_domain_repo.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'training_plan_domain_provider.g.dart';

final trainingPlanDomainProvider = Provider<TrainingPlanDomainRepo>((ref) {
  final trainingPlanRepoData = ref.watch(trainingPlanDataProvider);
  return TrainingPlanDomainRepo(trainingPlanRepoData: trainingPlanRepoData);
});

@riverpod
class TrainingPlanDomainProviderAsync
    extends _$TrainingPlanDomainProviderAsync {
  @override
  FutureOr<List<TrainingPlanClass>> build({required String id}) async {
    return getTrainingPlan(id: id);
  }

  Future<List<TrainingPlanClass>> getTrainingPlan({required String id}) async {
    List<TrainingPlanClass> planBuild = [];
    final trainingPlanRepo = ref.read(trainingPlanDomainProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final plan = await trainingPlanRepo.getTrainingPlan(id: id);
      state = AsyncValue.data(plan);
      planBuild = plan;
      return plan;
    });
    return planBuild;
  }
}
