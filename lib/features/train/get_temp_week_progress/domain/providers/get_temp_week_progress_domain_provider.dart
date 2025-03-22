import 'package:fitflow/features/train/get_temp_week_progress/data/providers/get_temp_week_progress_data_provider.dart';
import 'package:fitflow/features/train/get_temp_week_progress/domain/models/training_day_for_domain.dart';
import 'package:fitflow/features/train/get_temp_week_progress/domain/repo/get_temp_week_progress_repo_domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_temp_week_progress_domain_provider.g.dart';

final getTempWeekProgressDomainProvider =
    Provider<GetTempWeekProgressRepoDomain>((ref) {
  final tempWeekProgressRepoData = ref.watch(getTempWeekProgressDataProvider);
  return GetTempWeekProgressRepoDomain(
      tempWeekProgressRepoData: tempWeekProgressRepoData);
});

@riverpod
class GetTempWeekProgressDomainProviderAsync
    extends _$GetTempWeekProgressDomainProviderAsync {
  @override
  FutureOr<List<TrainingDayForDomain>> build() {
    return getTempWeekProgress();
  }

  Future<List<TrainingDayForDomain>> getTempWeekProgress() async {
    List<TrainingDayForDomain> returnedList = [];
    final tempWeekRepo = ref.read(getTempWeekProgressDomainProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final trainings = await tempWeekRepo.getTempWeekProgressDomain();
      state = AsyncValue.data(trainings);
      returnedList = trainings;
      return trainings;
    });
    return returnedList;
  }
}
