import 'package:fitflow/features/auth/auth_reset_password/data/providers/auth_reset_pass_data_provider.dart';
import 'package:fitflow/features/auth/auth_reset_password/domain/repo/auth_reset_password_domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authResetPasswordDomainProvider =
    Provider<AuthResetPasswordDomain>((ref) {
  final authSignUpData = ref.watch(authResetPassDataProvider);
  return AuthResetPasswordDomain(authResetPassRepo: authSignUpData);
});
