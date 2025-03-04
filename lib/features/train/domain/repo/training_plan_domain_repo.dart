import 'package:fitflow/features/train/data/repo/training_plan_repo.dart';
import 'package:fitflow/features/train/domain/models/training_plan_class.dart';
import 'package:fitflow/features/train/domain/repo/training_plan_domain_impl.dart';

class TrainingPlanDomainRepo implements TrainingPlanDomainImpl {
  final TrainingPlanRepoData trainingPlanRepoData;

  TrainingPlanDomainRepo({required this.trainingPlanRepoData});

  @override
  Future<List<TrainingPlanClass>> getTrainingPlan({required String id}) async {
    return await trainingPlanRepoData.getTrainingPlan(id: id);
  }
}
