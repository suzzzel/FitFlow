abstract class AuthSignInDomainRepoImpl {
  Future<bool> signIn({required String emailOrName, required String password});
}
