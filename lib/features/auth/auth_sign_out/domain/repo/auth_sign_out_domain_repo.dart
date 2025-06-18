import 'package:fitflow/features/auth/auth_sign_out/data/repo/auth_sign_out_data_repo.dart';
import 'package:fitflow/features/auth/auth_sign_out/domain/repo/auth_sign_out_domain_repo_impl.dart';

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
