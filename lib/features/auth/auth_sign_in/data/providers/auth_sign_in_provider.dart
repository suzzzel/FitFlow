import 'package:fitflow/features/auth/auth_sign_in/data/repo/auth_sign_in_repo.dart';
import 'package:fitflow/features/general_comonents/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authSignInProvider = Provider<AuthSignInRepo>((ref) {
  final supabaseClient = ref.watch(supabaseProvider);
  return AuthSignInRepo(supabase: supabaseClient);
});
