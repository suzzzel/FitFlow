import 'package:fitflow/features/train/domain/models/training_plan_class.dart';

abstract class GetTrainingPlanDataImpl {
  Future<List<TrainingPlanClass>> getTrainingPlan({required String id});
}
