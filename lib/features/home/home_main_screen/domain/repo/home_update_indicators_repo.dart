// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitflow/features/home/home_main_screen/data/repo/home_update_indicators_repo.dart';
import 'package:fitflow/features/home/home_main_screen/domain/repo/home_update_indicators_impl.dart';

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
  Future<bool> updateHeight({required int newHeight}) {
    // TODO: implement updateHeight
    throw UnimplementedError();
  }

  @override
  Future<bool> updateWeight({required int newWeight}) {
    // TODO: implement updateWeight
    throw UnimplementedError();
  }
}
