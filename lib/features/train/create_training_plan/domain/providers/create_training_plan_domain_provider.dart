import 'package:fitflow/features/train/create_training_plan/data/providers/get_ready_plans_data_provider.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final createTrainPlanDomainProvider =
    FutureProvider.autoDispose<Map<int, List<ReadyTrainingPlanModel>>>(
        (ref) async {
  final readyPlans = await ref
      .read(getReadyPlansDataProvider)
      .getReadyTrainingPlansAndDownloadGifsEx();
  return readyPlans;
});
