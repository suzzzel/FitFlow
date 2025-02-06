abstract class AuthResetPasswordDomainImpl {
  Future<bool> sendRecoveryCode({required String email});

  Future<bool> updatePassword(
      {required String email,
      required String recoveryCode,
      required String newPassword});
}
