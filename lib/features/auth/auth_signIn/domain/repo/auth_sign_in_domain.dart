// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitflow/features/auth/auth_signIn/data/repo/auth_sign_in_repo.dart';
import 'package:fitflow/features/auth/auth_signIn/domain/repo/auth_sign_in_domain_repo_impl.dart';

class AuthSignInDomain implements AuthSignInDomainRepoImpl {
  final AuthSignInRepo authSignInRepo;
  AuthSignInDomain({
    required this.authSignInRepo,
  });

  @override
  Future<bool> signIn(
      {required String emailOrName, required String password}) async {
    return await authSignInRepo.signIn(
        emailOrName: emailOrName, password: password);
  }
}
