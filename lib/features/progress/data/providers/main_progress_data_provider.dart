import 'package:fitflow/features/general_comonents/drift_app_database_provider.dart';
import 'package:fitflow/features/general_comonents/supabase_provider.dart';
import 'package:fitflow/features/progress/data/repo/main_progress_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainProgressDataProvider = Provider<MainProgressRepo>((ref) {
  final database = ref.watch(localDatabaseProvider);
  final supabase = ref.watch(supabaseProvider);
  return MainProgressRepo(database: database, supabase: supabase);
});
