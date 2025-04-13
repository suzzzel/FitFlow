import 'package:fitflow/features/train/create_training_plan/data/providers/get_ready_plans_data_provider.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';
import 'package:fitflow/features/train/get_training_plan/domain/providers/get_training_plan_domain_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'confrim_ready_plan_controller.g.dart';

@riverpod
class ConfrimReadyPlanController extends _$ConfrimReadyPlanController {
  @override
  FutureOr<void> build() {}

  Future<bool> confirmReadyPlan(
      {required List<ReadyTrainingPlanModel> days}) async {
    final createRepo = ref.read(readyPlansDataProvider);
    state = const AsyncValue.loading();
    try {
      final addedPlan = await createRepo.confirmPlan(days: days);
      ref.invalidate(getTrainingPlanDomainProviderAsyncProvider);
      return addedPlan;
    } catch (e) {
      return false;
    }
  }
}
