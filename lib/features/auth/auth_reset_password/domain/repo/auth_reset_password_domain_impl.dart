abstract class AuthResetPasswordDomainImpl {
  Future<bool> sendRecoveryCode({required String email});

  Future<bool> enterRecoveryCode({
    required String email,
    required String recoveryCode,
  });

  Future<bool> updatePassword({required String newPassword});
}
