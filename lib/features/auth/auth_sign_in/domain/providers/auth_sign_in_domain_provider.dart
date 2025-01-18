import 'package:fitflow/features/auth/auth_sign_in/data/providers/auth_sign_in_provider.dart';
import 'package:fitflow/features/auth/auth_sign_in/domain/repo/auth_sign_in_domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authSignInDomainProvider = Provider<AuthSignInDomain>((ref) {
  final authSignInData = ref.watch(authSignInProvider);
  return AuthSignInDomain(authSignInRepo: authSignInData);
});

final obscurePasswordProvider = StateProvider<bool>((ref) => true);
