import 'package:fitflow/features/auth/auth_signOut/data/repo/auth_sign_out_data_repo.dart';
import 'package:fitflow/features/general_providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authSignOutDataProvider = Provider<AuthSignOutDataRepo>((ref) {
  final supabase = ref.watch(supabaseProvider);
  return AuthSignOutDataRepo(supabase: supabase);
});
