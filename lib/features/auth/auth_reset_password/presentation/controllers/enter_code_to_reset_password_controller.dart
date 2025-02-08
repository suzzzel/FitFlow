import 'dart:developer';

import 'package:fitflow/features/auth/auth_reset_password/domain/providers/auth_reset_pass_domain_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'enter_code_to_reset_password_controller.g.dart';

@riverpod
class EnterCodeToResetPasswordController
    extends _$EnterCodeToResetPasswordController {
  @override
  FutureOr<bool?> build() {
    return null;
  }

  Future<bool> enterCode({required String code, required String email}) async {
    final authResetRepo = ref.watch(authResetPasswordDomainProvider);
    // state = const AsyncLoading();
    // state = await AsyncValue.guard(() async {
    //   final enterCodeOk =
    //       await authResetRepo.updatePassword(email: email, recoveryCode: code);
    //   return enterCodeOk;
    // });
    // return state.value == true ? true : false;
    state = const AsyncValue.loading();
    try {
      final enterCodeOk = await AsyncValue.guard(() =>
          authResetRepo.enterRecoveryCode(email: email, recoveryCode: code));
      state = enterCodeOk;
      return enterCodeOk.value!;
    } catch (e) {
      log(e.runtimeType.toString());
      return false;
    }
  }

  void enterNewCode() {
    state = const AsyncValue.data(null);
  }
}
