import 'package:fitflow/features/home/future_profile/domain/providers/home_buttons_domain_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_train_plan_controller.g.dart';

@riverpod
class DeleteTrainPlanController extends _$DeleteTrainPlanController {
  @override
  FutureOr<void> build() {}

  Future<bool> deleteTrain() async {
    final homeButtonRepo = ref.read(homeButtonsDomainProvider);
    try {
      state = AsyncLoading();
      final deleteTrainState =
          await AsyncValue.guard(() => homeButtonRepo.deleteTrainingPlan());
      state = deleteTrainState;
      return deleteTrainState.value ?? false;
    } catch (e) {
      return false;
    }
  }
}
