abstract class AuthResetPassRepoImpl {
  Future<bool> resetPassword({required String email});
  Future<bool> updatePassword(
      {required String email,
      required String recoveryCode,
      required String newPassword});
}
