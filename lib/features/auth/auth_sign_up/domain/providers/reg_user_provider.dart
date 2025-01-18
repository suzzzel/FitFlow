import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegUserNotifier extends StateNotifier<AppUser> {
  RegUserNotifier() : super(AppUser(id: 0));

  void addGender(bool gender) {
    state = AppUser(id: 0, sex: gender);
  }
}

final regUserProvider =
    StateNotifierProvider<RegUserNotifier, AppUser>((ref) => RegUserNotifier());
