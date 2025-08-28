import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/profile/domain/providers/home_buttons_domain_provider.dart';
import 'package:fitflow/features/train/create_training_plan/domain/controllers/confrim_ready_plan_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_custom_plan_controller.g.dart';

@riverpod
class SaveCustomPlanController extends _$SaveCustomPlanController {
  @override
  FutureOr<void> build() {}

  Future<bool> updateExistPlan(
      {required Map<String, List<ExerciseModel>> exerciseByWeekday}) async {
    final homeButtonsRepo = ref.read(homeButtonsDomainProvider);
    state = const AsyncLoading();
    try {
      final updatePlan = await AsyncValue.guard(
          () => homeButtonsRepo.updateTrainPlan(plan: exerciseByWeekday));
      state = updatePlan;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> saveCustomPlan(
      {required Map<String, List<ExerciseModel>> exerciseByWeekday}) async {
    final confrimReadyPlanController =
        ref.watch(confrimReadyPlanControllerProvider.notifier);
    state = const AsyncLoading();
    try {
      final updatePlan = await AsyncValue.guard(() =>
          confrimReadyPlanController.confirmReadyPlan(days: exerciseByWeekday));
      state = updatePlan;
      return true;
    } catch (e) {
      return false;
    }
  }
}
