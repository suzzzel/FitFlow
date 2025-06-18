import 'package:fitflow/features/train/create_training_plan/data/providers/get_ready_plans_data_provider.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/repo/create_training_plan_domain_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final getReadyTrainPlanDomainProvider =
    FutureProvider.autoDispose<Map<int, List<ReadyTrainingPlanModel>>>(
        (ref) async {
  final dataRepo = ref.watch(readyPlansDataProvider);
  final domainToData =
      CreateTrainingPlanDomainRepo(createTrainingPlanRepo: dataRepo);
  final readyPlans = await domainToData.getReadyTrainingPlans();
  return readyPlans;
});
