import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/domain/models/training_day_class.dart';
import 'package:fitflow/features/train/get_today_train_info/data/providers/get_today_train_info_provider_data.dart';
import 'package:fitflow/features/train/get_today_train_info/domain/repo/get_today_train_info_domain.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_today_train_info_domain_provider.g.dart';

final getTodayTrainInfoDomainProvider =
    Provider<GetTodayTrainInfoDomain>((ref) {
  final todayTrainInfoRepoData = ref.watch(geTodayTrainInfoDataProvider);
  return GetTodayTrainInfoDomain(getTodayTrainInfoData: todayTrainInfoRepoData);
});

@riverpod
class GetTodayTrainInfoDomainProviderAsync
    extends _$GetTodayTrainInfoDomainProviderAsync {
  @override
  FutureOr<TrainingDayClass?> build() async {
    return getTodayTrainInfoAsync();
  }

  Future<TrainingDayClass?> getTodayTrainInfoAsync() async {
    final todayTrainInfoDomainProv = ref.read(getTodayTrainInfoDomainProvider);
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () async {
        final todayTrain = await todayTrainInfoDomainProv.getTodayTrainInfo();
        state = AsyncValue.data(todayTrain);
        return todayTrain;
      },
    );
    return state.hasError ? null : state.value;
  }
}
