import 'package:fitflow/features/train/get_training_plan/domain/models/training_plan_class.dart';

abstract class GetTrainingPlanDataImpl {
  Future<List<TrainingPlanClass>> getTrainingPlan({required String id});
}
