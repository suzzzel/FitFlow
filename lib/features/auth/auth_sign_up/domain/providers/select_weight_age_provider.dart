import 'package:fitflow/features/auth/auth_sign_up/domain/providers/select_gender_provider.dart';
import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectWeightProvider = StateProvider<int>((ref) {
  final gender = ref.watch(selectGenderProvider);
  final authUser = ref.watch(authStateProvider);
  final user = authUser.value?.user;
  if (user != null) {
    return user.weight!;
  } else {
    switch (gender) {
      case 0:
        return 0;
      case 1:
        return 72;
      case 2:
        return 55;
      default:
        return 0;
    }
  }
});

final selectAgeProvider = StateProvider<int>((ref) {
  final authUser = ref.watch(authStateProvider);
  final user = authUser.value?.user;
  if (user != null) {
    return user.age!;
  } else {
    return 35;
  }
});
