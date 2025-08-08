import 'package:fitflow/features/auth/auth_sign_out/data/repo/auth_sign_out_data_repo.dart';
import 'package:fitflow/features/general_comonents/drift_app_database_provider.dart';
import 'package:fitflow/features/general_comonents/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authSignOutDataProvider = Provider<AuthSignOutDataRepo>((ref) {
  final supabase = ref.watch(supabaseProvider);
  final database = ref.watch(localDatabaseProvider);
  return AuthSignOutDataRepo(supabase: supabase, database: database);
});
