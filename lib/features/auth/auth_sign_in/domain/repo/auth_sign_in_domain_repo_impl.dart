import 'package:fitflow/features/auth/auth_sign_in/domain/models/sign_in_state.dart';

abstract class AuthSignInDomainRepoImpl {
  Future<SignInState> signIn(
      {required String emailOrName, required String password});
}
