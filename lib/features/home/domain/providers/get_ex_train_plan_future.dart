import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/home/data/providers/home_data_provider.dart';
import 'package:fitflow/features/home/domain/repo/home_domain_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getExInfoTrainingPlanProvider =
    FutureProvider.autoDispose<Map<String, List<ExerciseModel>>>((ref) async {
  final dataToRepo = ref.watch(homeDataProvider);
  final domainToData = HomeDomainRepo(homeDataRepo: dataToRepo);
  return await domainToData.getTempTrainPlan();
});
