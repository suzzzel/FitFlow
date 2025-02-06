import 'package:fitflow/features/auth/auth_reset_password/data/repo/auth_reset_pass_repo.dart';
import 'package:fitflow/features/general_providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authResetPassDataProvider = Provider<AuthResetPassRepo>((ref) {
  final supabaseClient = ref.watch(supabaseProvider);
  return AuthResetPassRepo(supabase: supabaseClient);
});
