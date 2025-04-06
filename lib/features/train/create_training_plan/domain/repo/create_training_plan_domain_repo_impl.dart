import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';

abstract class CreateTrainingPlanDomainRepoImpl {
  Future<Map<int, List<ReadyTrainingPlanModel>>> getReadyTrainingPlans();
}
