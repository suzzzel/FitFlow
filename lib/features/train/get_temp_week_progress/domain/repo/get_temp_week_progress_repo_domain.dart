import 'package:fitflow/features/train/get_temp_week_progress/data/repo/get_temp_week_progress_repo.dart';
import 'package:fitflow/features/train/get_temp_week_progress/domain/models/training_day_for_domain.dart';
import 'package:fitflow/features/train/get_temp_week_progress/domain/repo/get_temp_week_progress_repo_domain_impl.dart';

class GetTempWeekProgressRepoDomain
    implements GetTempWeekProgressRepoDomainImpl {
  final GetTempWeekProgressRepoData tempWeekProgressRepoData;

  GetTempWeekProgressRepoDomain({required this.tempWeekProgressRepoData});
  @override
  Future<List<TrainingDayForDomain>> getTempWeekProgressDomain() async {
    final listTrainings = await tempWeekProgressRepoData.getTempWeekTrainings();
    List<TrainingDayForDomain> returnedList = [];
    if (listTrainings.isEmpty) {
      return [];
    } else {
      for (var x in listTrainings) {
        returnedList.add(TrainingDayForDomain(
            isChillDay: x.isChillday,
            percentOfTrainDone: x.percentOfTrainDone ?? 0));
      }
      return returnedList;
    }
  }
}
