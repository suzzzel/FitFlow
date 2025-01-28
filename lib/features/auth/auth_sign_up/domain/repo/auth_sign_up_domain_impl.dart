import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';

abstract class AuthSignUpDomainImpl {
  Future<bool> signUp(
      {required String email, required String password, required AppUser user});
}
