import 'package:fitflow/features/auth/auth_reset_password/domain/models/reset_pass_enums.dart';
import 'package:fitflow/features/auth/auth_reset_password/domain/providers/auth_reset_pass_domain_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'enter_new_pass_controller.g.dart';

@riverpod
class UpdatePassController extends _$UpdatePassController {
  @override
  FutureOr<bool?> build() {
    return null;
  }

  Future<UpdatePasswordStatus> updatePass({
    required String newPassword,
  }) async {
    final authResetRepo = ref.watch(authResetPasswordDomainProvider);
    state = const AsyncValue.loading();
    try {
      final updatePassComplete =
          await authResetRepo.updatePassword(newPassword: newPassword);
      if (updatePassComplete == UpdatePasswordStatus.sucess) {
        state = const AsyncData(true);
      } else {
        updatePassComplete == UpdatePasswordStatus.networkError
            ? state = const AsyncData(null)
            : state = const AsyncData(false);
      }
      return updatePassComplete;
    } catch (e) {
      return UpdatePasswordStatus.failure;
    }
  }
}
