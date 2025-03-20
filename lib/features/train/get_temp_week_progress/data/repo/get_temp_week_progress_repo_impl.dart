import 'package:fitflow/features/train/get_temp_week_progress/domain/models/training_day_class.dart';

abstract class GetTempWeekProgressRepoImpl {
  Future<List<TrainingDayClass>> getTempWeekTrainings();
}
