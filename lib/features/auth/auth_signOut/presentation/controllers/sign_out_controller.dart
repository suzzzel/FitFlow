import 'package:fitflow/features/auth/auth_signOut/domain/providers/auth_sign_out_domain_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_out_controller.g.dart';

@riverpod
class SignOutController extends _$SignOutController {
  @override
  FutureOr<void> build() {}

  Future<void> signOut() async {
    final authRepo = ref.read(authSignOutDomainProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      authRepo.signOut();
    });
  }
}
