// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:fitflow/features/auth/auth_signIn/domain/providers/auth_sign_in_domain_provider.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  SignInController();

  @override
  FutureOr<void> build() {}

  Future<bool> signIn(
      {required String emailOrName, required String password}) async {
    final authRepo = ref.read(authSignInDomainProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => authRepo.signIn(emailOrName: emailOrName, password: password));
    log('VALUE: ${state.hasValue.toString()}');
    log('error: ${state.hasError.toString()}');
    return state.hasError;
  }
}
