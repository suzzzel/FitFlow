// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/data/repo/create_training_plan_repo.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/repo/create_training_plan_domain_repo_impl.dart';

class CreateTrainingPlanDomainRepo implements CreateTrainingPlanDomainRepoImpl {
  final CreateTrainingPlanRepo createTrainingPlanRepo;
  CreateTrainingPlanDomainRepo({
    required this.createTrainingPlanRepo,
  });
  @override
  Future<Map<int, List<ReadyTrainingPlanModel>>> getReadyTrainingPlans() async {
    final readyPlans =
        await createTrainingPlanRepo.getReadyTrainingPlansAndDownloadGifsEx();
    return readyPlans;
  }

  @override
  Future<List<ExerciseModel>> getInfoAboutTempExercises(
      {required String idTrainingPlan}) async {
    try {
      final exercises = await createTrainingPlanRepo.getInfoExercises(
          trainingPlanId: idTrainingPlan);
      return exercises;
    } on Exception {
      rethrow;
    }
  }
}
