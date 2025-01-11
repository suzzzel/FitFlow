// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitflow/features/auth/auth_signOut/data/repo/auth_sign_out_data_repo.dart';
import 'package:fitflow/features/auth/auth_signOut/domain/repo/auth_sign_out_domain_repo_impl.dart';

class AuthSignOutDomainRepo implements AuthSignOutDomainRepoImpl {
  final AuthSignOutDataRepo authSignOutDataRepo;
  AuthSignOutDomainRepo({
    required this.authSignOutDataRepo,
  });

  @override
  Future<void> signOut() async {
    await authSignOutDataRepo.signOut();
  }
}
