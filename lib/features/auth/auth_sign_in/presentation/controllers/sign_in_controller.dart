// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fitflow/features/auth/auth_sign_in/domain/models/sign_in_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:fitflow/features/auth/auth_sign_in/domain/providers/auth_sign_in_domain_provider.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInControllerNEW extends _$SignInControllerNEW {
  SignInControllerNEW();

  @override
  FutureOr<void> build() {}

  Future<SignInState> signIn(
      {required String emailOrName, required String password}) async {
    final authRepo = ref.read(authSignInDomainProvider);
    state = const AsyncLoading();
    try {
      final signInState = await AsyncValue.guard(
          () => authRepo.signIn(emailOrName: emailOrName, password: password));
      state = signInState;
      return signInState.value ?? SignInState.notAuth;
    } catch (e) {
      return SignInState.networkError;
    }
  }
}
