// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitflow/features/progress/data/repo/main_progress_repo.dart';
import 'package:fitflow/features/progress/domain/models/exercises_into_day_model.dart';
import 'package:fitflow/features/progress/domain/models/main_progress_model.dart';
import 'package:fitflow/features/progress/domain/repo/main_progress_domain_impl.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/domain/models/training_day_class.dart';

class MainProgressDomain implements MainProgressDomainImpl {
  final MainProgressRepo dataRepo;
  MainProgressDomain({
    required this.dataRepo,
  });
  @override
  Future<MainProgressModel> getMainProgress() async {
    final mainProgress = await dataRepo.getMainProgressAboutUser();
    return mainProgress!;
  }

  @override
  Future<List<ExercisesIntoDayModel>> getProgressByDay(
      {required TrainingDayClass dayOfTrain}) async {
    final getProgress = await dataRepo.getProgressByDay(dayOfTrain: dayOfTrain);
    return getProgress;
  }
}
