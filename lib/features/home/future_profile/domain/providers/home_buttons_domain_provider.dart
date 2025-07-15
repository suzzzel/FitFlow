import 'package:fitflow/features/home/future_profile/data/providers/home_buttons_data_provider.dart';
import 'package:fitflow/features/home/future_profile/domain/repo/home_buttons/home_buttons_domain_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeButtonsDomainProvider = Provider<HomeButtonsDomainRepo>((ref) {
  final homeButtonsRepo = ref.watch(homeButtonsDataProvider);
  return HomeButtonsDomainRepo(homeButtonsRepo: homeButtonsRepo);
});
