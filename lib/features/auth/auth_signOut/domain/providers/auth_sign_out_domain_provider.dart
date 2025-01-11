import 'package:fitflow/features/auth/auth_signOut/data/providers/auth_sign_out_data_provider.dart';
import 'package:fitflow/features/auth/auth_signOut/domain/repo/auth_sign_out_domain_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authSignOutDomainProvider = Provider<AuthSignOutDomainRepo>((ref) {
  final authSignOut = ref.watch(authSignOutDataProvider);
  return AuthSignOutDomainRepo(authSignOutDataRepo: authSignOut);
});
