import 'package:fitflow/features/auth/auth_sign_up/data/providers/auth_sign_up_data_provider.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/repo/auth_sign_up_domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authSignUpDomainProvider = Provider<AuthSignUpDomain>((ref) {
  final authSignUpData = ref.watch(authSignUpProvider);
  return AuthSignUpDomain(authSignUpData: authSignUpData);
});
