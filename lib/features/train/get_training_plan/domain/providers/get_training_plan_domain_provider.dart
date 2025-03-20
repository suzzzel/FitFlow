import 'package:fitflow/features/train/get_training_plan/data/providers/get_training_plan_data_provider.dart';
import 'package:fitflow/features/train/get_training_plan/domain/models/training_plan_class.dart';
import 'package:fitflow/features/train/get_training_plan/domain/repo/get_training_plan_domain_repo.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_training_plan_domain_provider.g.dart';

final getTrainingPlanDomainProvider =
    Provider<GetTrainingPlanDomainRepo>((ref) {
  final trainingPlanRepoData = ref.watch(getTrainingPlanDataProvider);
  return GetTrainingPlanDomainRepo(trainingPlanRepoData: trainingPlanRepoData);
});

@riverpod
class GetTrainingPlanDomainProviderAsync
    extends _$GetTrainingPlanDomainProviderAsync {
  @override
  FutureOr<List<TrainingPlanClass>> build({required String id}) async {
    return getTrainingPlan(id: id);
  }

  Future<List<TrainingPlanClass>> getTrainingPlan({required String id}) async {
    List<TrainingPlanClass> planBuild = [];
    final trainingPlanRepo = ref.read(getTrainingPlanDomainProvider);
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
