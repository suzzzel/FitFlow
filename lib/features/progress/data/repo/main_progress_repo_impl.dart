import 'package:fitflow/features/progress/domain/models/main_progress_model.dart';

abstract class MainProgressRepoImpl {
  Future<MainProgressModel?> getMainProgressAboutUser();

  Future<void> getProgressByDay({required String idUser, required String date});
}
