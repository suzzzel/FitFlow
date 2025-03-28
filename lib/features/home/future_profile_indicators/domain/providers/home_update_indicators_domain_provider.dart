import 'package:fitflow/features/home/future_profile_indicators/data/providers/home_update_indicators_provider.dart';
import 'package:fitflow/features/home/future_profile_indicators/domain/repo/home_update_indicators_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeUpdateIndicatorsDomainProvider =
    Provider<HomeUpdateIndicatorsRepoDomain>((ref) {
  final homeUpdateIndicatorsRepo = ref.watch(homeIndicatorsDataProvider);
  return HomeUpdateIndicatorsRepoDomain(
      homeUpdateIndicatorsRepo: homeUpdateIndicatorsRepo);
});
