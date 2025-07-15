import 'package:fitflow/features/home/future_profile/data/repo/indicators_repo/home_update_indicators_repo.dart';
import 'package:fitflow/features/home/future_profile/domain/repo/indicators_repo_domain/home_update_indicators_impl.dart';

class HomeUpdateIndicatorsRepoDomain implements HomeUpdateIndicatorsDomainImpl {
  final HomeUpdateIndicatorsRepoData homeUpdateIndicatorsRepo;
  HomeUpdateIndicatorsRepoDomain({
    required this.homeUpdateIndicatorsRepo,
  });
  @override
  Future<bool> updateAge({required int newAge}) async {
    return await homeUpdateIndicatorsRepo.updateAge(newAge);
  }

  @override
  Future<bool> updateHeight({required int newHeight}) async {
    return await homeUpdateIndicatorsRepo.updateHeight(newHeight);
  }

  @override
  Future<bool> updateWeight({required int newWeight}) async {
    return await homeUpdateIndicatorsRepo.updateWeight(newWeight);
  }
}
