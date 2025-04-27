import 'package:fitflow/features/general_comonents/drift_app_database_provider.dart';
import 'package:fitflow/features/general_comonents/supabase_provider.dart';
import 'package:fitflow/features/search/search_ex/data/repo/search_ex_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchExDataProvider = Provider<SearchExerciseRepo>((ref) {
  final database = ref.watch(localDatabaseProvider);
  final supabase = ref.watch(supabaseProvider);
  return SearchExerciseRepo(database: database, supabase: supabase);
});
