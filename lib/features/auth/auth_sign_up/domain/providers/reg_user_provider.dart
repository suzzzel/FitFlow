import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegUserNotifier extends StateNotifier<AppUser> {
  RegUserNotifier() : super(AppUser(id: 0));

  void addGender(bool gender) {
    state = AppUser(id: 0, sex: gender);
  }

  void addWeight(int weightNew) {
    state = state.copyWith(weight: weightNew);
  }

  void addAge(int ageNew) {
    state = state.copyWith(age: ageNew);
  }

  void addHeight(int heightNew) {
    state = state.copyWith(height: heightNew);
  }
}

final regUserProvider =
    StateNotifierProvider<RegUserNotifier, AppUser>((ref) => RegUserNotifier());
