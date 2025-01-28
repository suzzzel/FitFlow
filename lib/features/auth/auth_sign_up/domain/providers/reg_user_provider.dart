import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegUserNotifier extends StateNotifier<AppUser> {
  RegUserNotifier() : super(AppUser());

  void addGender(bool gender) {
    state = AppUser(sex: gender);
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

  void addGoal(String goalNew) {
    late final String setGoal;
    switch (goalNew) {
      case 'Гибкость':
        setGoal = 'flexibility';
      case 'Выносливость':
        setGoal = 'endurance';
      case 'Сила':
        setGoal = 'strength';
    }
    state = state.copyWith(goal: setGoal);
  }

  void addName(String nameNew) {
    state = state.copyWith(name: nameNew);
  }

  void addCreateAt() {
    final DateTime now = DateTime.now();
    final DateTime utc = now.toUtc();
    final String timeNow = utc.toIso8601String();
    state = state.copyWith(created_at: timeNow);
  }

  void addEmail(String emailNew) {
    state = state.copyWith(email: emailNew);
  }

  void addLevel(String levelNew) {
    state = state.copyWith(level: levelNew);
  }
}

final regUserProvider =
    StateNotifierProvider<RegUserNotifier, AppUser>((ref) => RegUserNotifier());
