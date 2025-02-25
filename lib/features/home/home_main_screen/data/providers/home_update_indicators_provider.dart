import 'package:fitflow/features/general_providers/drift_app_database_provider.dart';
import 'package:fitflow/features/general_providers/supabase_provider.dart';
import 'package:fitflow/features/home/home_main_screen/data/repo/home_update_indicators_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeIndicatorsDataProvider =
    Provider<HomeUpdateIndicatorsRepoData>((ref) {
  final database = ref.watch(localDatabaseProvider);
  final supabase = ref.watch(supabaseProvider);
  return HomeUpdateIndicatorsRepoData(database: database, supabase: supabase);
});
