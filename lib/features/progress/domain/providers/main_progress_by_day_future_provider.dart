import 'package:fitflow/features/progress/data/providers/main_progress_data_provider.dart';
import 'package:fitflow/features/progress/domain/models/exercises_into_day_model.dart';
import 'package:fitflow/features/progress/domain/repo/main_progress_domain.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/domain/models/training_day_class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getProgressByDayInMainProgressProvider = FutureProvider.autoDispose
    .family<List<ExercisesIntoDayModel>, TrainingDayClass>(
        (ref, dayOfTrain) async {
  final dataRepo = ref.watch(mainProgressDataProvider);
  final domainToProv = MainProgressDomain(dataRepo: dataRepo);
  return await domainToProv.getProgressByDay(dayOfTrain: dayOfTrain);
});
