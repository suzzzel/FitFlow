import 'package:fitflow/features/auth/auth_reset_password/domain/providers/auth_reset_pass_domain_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'enter_new_pass_controller.g.dart';

@riverpod
class UpdatePassController extends _$UpdatePassController {
  @override
  FutureOr<bool?> build() {
    return null;
  }

  Future<bool> updatePass({
    required String newPassword,
  }) async {
    final authResetRepo = ref.watch(authResetPasswordDomainProvider);
    state = const AsyncValue.loading();
    try {
      final updatePassComplete =
          await authResetRepo.updatePassword(newPassword: newPassword);
      state = AsyncData(updatePassComplete);
      return updatePassComplete;
    } catch (e) {
      return false;
    }
  }
}
