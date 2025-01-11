import 'package:fitflow/features/auth/auth_signIn/data/providers/auth_sign_in_provider.dart';
import 'package:fitflow/features/auth/auth_signIn/domain/repo/auth_sign_in_domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authSignInDomainProvider = Provider<AuthSignInDomain>((ref) {
  final authSignInData = ref.watch(authSignInProvider);
  return AuthSignInDomain(authSignInRepo: authSignInData);
});
