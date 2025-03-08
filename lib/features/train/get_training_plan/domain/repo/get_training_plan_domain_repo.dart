import 'package:fitflow/features/train/get_training_plan/data/repo/get_training_plan_repo.dart';
import 'package:fitflow/features/train/get_training_plan/models/training_plan_class.dart';
import 'package:fitflow/features/train/get_training_plan/domain/repo/get_training_plan_domain_impl.dart';

class GetTrainingPlanDomainRepo implements GetTrainingPlanDomainImpl {
  final GetTrainingPlanRepoData trainingPlanRepoData;

  GetTrainingPlanDomainRepo({required this.trainingPlanRepoData});

  @override
  Future<List<TrainingPlanClass>> getTrainingPlan({required String id}) async {
    return await trainingPlanRepoData.getTrainingPlan(id: id);
  }
}
