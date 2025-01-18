abstract class AuthSignInRepoImpl {
  Future<void> signIn({required String emailOrName, required String password});
}
