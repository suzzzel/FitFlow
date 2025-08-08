import 'package:fitflow/features/general_comonents/drift_app_database_provider.dart';
import 'package:fitflow/features/general_comonents/supabase_provider.dart';
import 'package:fitflow/features/profile/data/repo/indicators_repo/home_update_indicators_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeIndicatorsDataProvider =
    Provider<HomeUpdateIndicatorsRepoData>((ref) {
  final database = ref.watch(localDatabaseProvider);
  final supabase = ref.watch(supabaseProvider);
  return HomeUpdateIndicatorsRepoData(database: database, supabase: supabase);
});
