abstract class AuthSignInDomainRepoImpl {
  Future<void> signIn({required String emailOrName, required String password});
}
