import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectHeightMainProvider = StateProvider<int>((ref) {
  final authUser = ref.watch(authStateProvider);
  final user = authUser.value?.user;
  if (user != null) {
    return user.height!;
  } else {
    return 170;
  }
});

final selectHeightPrevOneProvider = StateProvider.autoDispose<int>((ref) {
  final mainHeight = ref.watch(selectHeightMainProvider);
  return mainHeight - 1;
});

final selectHeightNextOneProvider = StateProvider.autoDispose<int>((ref) {
  final mainHeight = ref.watch(selectHeightMainProvider);
  return mainHeight + 1;
});
