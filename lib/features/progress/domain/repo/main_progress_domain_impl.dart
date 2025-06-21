import 'package:fitflow/features/progress/domain/models/main_progress_model.dart';

abstract class MainProgressDomainImpl {
  Future<MainProgressModel> getMainProgress();
}
