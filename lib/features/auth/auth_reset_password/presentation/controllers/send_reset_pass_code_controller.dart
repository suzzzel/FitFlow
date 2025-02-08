import 'package:fitflow/features/auth/auth_reset_password/domain/providers/auth_reset_pass_domain_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_reset_pass_code_controller.g.dart';

@riverpod
class SendResetPassCodeController extends _$SendResetPassCodeController {
  @override
  FutureOr<void> build() {}

  Future<bool> sendResetCode({required String email}) async {
    final authResetRepo = ref.watch(authResetPasswordDomainProvider);
    state = const AsyncLoading();
    try {
      final codeSended = await AsyncValue.guard(
          () => authResetRepo.sendRecoveryCode(email: email));
      state = codeSended;
      return true;
    } catch (e) {
      return false;
    }
  }
}
