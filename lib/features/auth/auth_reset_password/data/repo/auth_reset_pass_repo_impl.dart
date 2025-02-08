abstract class AuthResetPassRepoImpl {
  Future<bool> resetPassword({required String email});
  Future<bool> enterRecoveryCode({
    required String email,
    required String recoveryCode,
  });
  Future<bool> updatePassword({required String newPassword});
}
