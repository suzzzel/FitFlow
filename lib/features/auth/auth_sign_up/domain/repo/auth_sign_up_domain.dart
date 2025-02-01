// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitflow/features/auth/auth_sign_up/data/repo/auth_sign_up_data.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/models/sign_up_state.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/repo/auth_sign_up_domain_impl.dart';
import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';

class AuthSignUpDomain implements AuthSignUpDomainImpl {
  final AuthSignUpData authSignUpData;
  AuthSignUpDomain({
    required this.authSignUpData,
  });
  @override
  Future<bool> signUp(
      {required String email,
      required String password,
      required AppUser user}) async {
    final signUpBool = await authSignUpData.signUp(
        email: email, password: password, user: user);
    return signUpBool;
  }

  @override
  Future<SignUpState> signUpNEW(
      {required String email,
      required String password,
      required AppUser user}) async {
    final signUpBool = await authSignUpData.signUpNEW(
        email: email, password: password, user: user);
    return signUpBool;
  }
}
