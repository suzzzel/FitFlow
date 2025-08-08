// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitflow/features/profile/data/repo/home_buttons/home_buttons_data_repo.dart';
import 'package:fitflow/features/profile/domain/repo/home_buttons/home_buttons_domain_impl.dart';

class HomeButtonsDomainRepo implements HomeButtonsDomainImpl {
  final HomeButtonsRepo homeButtonsRepo;
  HomeButtonsDomainRepo({
    required this.homeButtonsRepo,
  });
  @override
  Future<bool> deleteTrainingPlan() async {
    return await homeButtonsRepo.deletePlan();
  }
}
