// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitflow/features/auth/auth_reset_password/data/repo/auth_reset_pass_repo.dart';
import 'package:fitflow/features/auth/auth_reset_password/domain/repo/auth_reset_password_domain_impl.dart';

class AuthResetPasswordDomain implements AuthResetPasswordDomainImpl {
  final AuthResetPassRepo authResetPassRepo;
  AuthResetPasswordDomain({
    required this.authResetPassRepo,
  });
  @override
  Future<bool> sendRecoveryCode({required String email}) async {
    return await authResetPassRepo.resetPassword(email: email);
  }

  @override
  Future<bool> updatePassword(
      {required String email,
      required String recoveryCode,
      required String newPassword}) async {
    return await authResetPassRepo.updatePassword(
        email: email, recoveryCode: recoveryCode, newPassword: newPassword);
  }
}
