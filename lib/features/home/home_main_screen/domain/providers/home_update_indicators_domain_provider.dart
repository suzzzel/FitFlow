import 'package:fitflow/features/home/home_main_screen/data/providers/home_update_indicators_provider.dart';
import 'package:fitflow/features/home/home_main_screen/domain/repo/home_update_indicators_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeUpdateIndicatorsDomainProvider =
    Provider<HomeUpdateIndicatorsRepoDomain>((ref) {
  final homeUpdateIndicatorsRepo = ref.watch(homeIndicatorsDataProvider);
  return HomeUpdateIndicatorsRepoDomain(
      homeUpdateIndicatorsRepo: homeUpdateIndicatorsRepo);
});
