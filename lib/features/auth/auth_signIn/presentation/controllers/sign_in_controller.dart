import 'package:fitflow/features/auth/auth_signIn/domain/providers/auth_sign_in_domain_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  FutureOr<void> build() {}

  Future<void> signIn(
      {required String emailOrName, required String password}) async {
    final authRepo = ref.read(authSignInDomainProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => authRepo.signIn(emailOrName: emailOrName, password: password));
  }
}
