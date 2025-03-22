import 'package:fitflow/features/train/get_temp_week_progress/domain/models/training_day_for_domain.dart';

abstract class GetTempWeekProgressRepoDomainImpl {
  Future<List<TrainingDayForDomain>> getTempWeekProgressDomain();
}
