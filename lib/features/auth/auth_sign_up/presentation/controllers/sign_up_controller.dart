import 'dart:developer';

import 'package:fitflow/features/auth/auth_sign_up/domain/models/sign_up_state.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/providers/auth_sign_up_domain_provider.dart';
import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<bool?> signUpNEW(
      {required String email,
      required String password,
      required AppUser user}) async {
    final authRepo = ref.read(authSignUpDomainProvider);
    state = const AsyncValue.loading();
    try {
      state = await AsyncValue.guard(() async {
        final signUpSupaBase =
            await authRepo.signUp(email: email, password: password, user: user);
        switch (signUpSupaBase) {
          case SignUpState.userAlreadyExist:
            return false;
          case SignUpState.networkError:
            return true;
          case SignUpState.unknown:
            return false;
          default:
            return true;
        }
      });
    } catch (e) {
      return null;
    }
    return state.value ?? false;
  }
}
