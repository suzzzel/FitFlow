import 'package:fitflow/features/auth/auth_sign_up/domain/models/sign_up_state.dart';
import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';

abstract class AuthSignUpDomainImpl {
  Future<SignUpState> signUp(
      {required String email, required String password, required AppUser user});
}
