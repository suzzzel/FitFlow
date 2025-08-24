// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/home/data/repo/home_data_repo.dart';
import 'package:fitflow/features/home/domain/repo/home_domain_impl.dart';

class HomeDomainRepo implements HomeDomainImpl {
  final HomeDataRepo homeDataRepo;
  HomeDomainRepo({
    required this.homeDataRepo,
  });
  @override
  Future<Map<String, List<ExerciseModel>>> getTempTrainPlan() async {
    return await homeDataRepo.getExerciseInTrainingPlan();
  }
}
